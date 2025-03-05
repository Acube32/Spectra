library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.textio.ALL;

entity spi_slave_tb is
end spi_slave_tb;

architecture Behavioral of spi_slave_tb is
    signal sclk    : std_logic := '0';
    signal mosi    : std_logic := '0';
    signal miso    : std_logic;
    signal ss_n    : std_logic := '1';
    signal data_in  : std_logic_vector(15 downto 0) := X"A5A5";
    signal data_out : std_logic_vector(15 downto 0);
    signal valid    : std_logic;
	 signal ready    : std_logic;

    
    constant CLK_PERIOD : time := 10 ns;
    
    component spi_slave
        Port (
            sclk    : in  std_logic;
            mosi    : in  std_logic;
            miso    : out std_logic;
            ss_n    : in  std_logic;
            data_in  : in  std_logic_vector(15 downto 0);
            data_out : out std_logic_vector(15 downto 0);
            valid    : out std_logic;
				ready    : out std_logic
        );
    end component;
    
begin
    uut: spi_slave port map (
        sclk    => sclk,
        mosi    => mosi,
        miso    => miso,
        ss_n    => ss_n,
        data_in  => data_in,
        data_out => data_out,
        valid    => valid,
		  ready    => ready
    );
    
    -- Clock process
    process
    begin
        while now < 1000 ns loop
            sclk <= '0';
            wait for CLK_PERIOD/2;
            sclk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    process
    begin
        -- Test case 1: Send first data pattern
        wait for 20 ns;
        ss_n <= '0';  -- Enable SPI slave
        for i in 15 downto 0 loop
            mosi <= data_in(i);
            wait for CLK_PERIOD;
        end loop;
        wait for 10 ns;
        ss_n <= '1';  -- Disable SPI slave
        
        -- Check data reception
        wait for 20 ns;
        assert valid = '1' report "First data transfer failed" severity error;
        
        -- Test case 2: Send different data
        wait for 50 ns;
        data_in <= X"5A5A";
		  wait for CLK_PERIOD;
        ss_n <= '0';
        for i in 15 downto 0 loop
            mosi <= data_in(i);
            wait for CLK_PERIOD;
        end loop;
		  
		  wait until ready = '1';
		  data_in <= X"1234";
        for i in 15 downto 0 loop
            mosi <= data_in(i);
            wait for CLK_PERIOD;
        end loop;
		  
        wait for 10 ns;
        ss_n <= '1';
        
        -- Check second reception
        wait for 20 ns;
        assert valid = '1' report "Second data transfer failed" severity error;
        
        -- Edge case: Glitch in SS
        wait for 50 ns;
        ss_n <= '0';
        wait for 5 ns;
        ss_n <= '1';  -- Simulate noise on SS
        wait for 10 ns;
        assert valid = '0' report "Glitch handling failed" severity error;
        
        wait;
    end process;
    
end Behavioral;
