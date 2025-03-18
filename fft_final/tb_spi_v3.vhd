library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spi_slave_tb is
end spi_slave_tb;

architecture Behavioral of spi_slave_tb is
    -- Component declaration for the SPI Slave module
    component spi_slave
        Port (
            sclk     : in  STD_LOGIC;
            ss       : in  STD_LOGIC;
            mosi     : in  STD_LOGIC;
            tx_data  : in  STD_LOGIC_VECTOR(15 downto 0);
            tx_valid : in  STD_LOGIC;
            miso     : out STD_LOGIC;
            rx_data  : out STD_LOGIC_VECTOR(15 downto 0);
            rx_valid : out STD_LOGIC;
            trdy     : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal sclk     : STD_LOGIC := '0';
    signal ss       : STD_LOGIC := '1';
    signal mosi     : STD_LOGIC := '0';
    signal tx_data  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal tx_valid : STD_LOGIC := '0';
    signal miso     : STD_LOGIC;
    signal rx_data  : STD_LOGIC_VECTOR(15 downto 0);
    signal rx_valid : STD_LOGIC;
    signal trdy     : STD_LOGIC;

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate the SPI Slave module
    uut: spi_slave
        Port Map (
            sclk     => sclk,
            ss       => ss,
            mosi     => miso,
            tx_data  => tx_data,
            tx_valid => tx_valid,
            miso     => miso,
            rx_data  => rx_data,
            rx_valid => rx_valid,
            trdy     => trdy
        );

    -- Clock generation process
    clk_process: process
    begin
        sclk <= '0';
        wait for CLK_PERIOD / 2;
        sclk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stim_process: process
    begin
        -- Initialize signals
        ss <= '1';
        mosi <= '0';
        tx_data <= (others => '0');
        tx_valid <= '0';
        wait for CLK_PERIOD;

        -- Test Case 1: Normal transmission
        ss <= '0';  -- Activate slave select
        tx_data <= x"ABCD";  -- Set tx_data
        tx_valid <= '1';  -- Indicate tx_data is valid
        wait for CLK_PERIOD*2;
        tx_valid <= '0';  -- Deassert tx_valid
        wait until trdy = '1';  -- Wait for 16 bits to be transmitted
        ss <= '1';  -- Deactivate slave select
        wait for CLK_PERIOD;

        -- Test Case 2: Change tx_data during transmission
        ss <= '0';  -- Activate slave select
        tx_data <= x"1234";  -- Set tx_data
        tx_valid <= '1';  -- Indicate tx_data is valid
        wait for CLK_PERIOD*2;
        tx_valid <= '0';  -- Deassert tx_valid
        wait for 8 * CLK_PERIOD;  -- Wait for 8 bits to be transmitted
        tx_data <= x"5678";  -- Change tx_data mid-transmission
        tx_valid <= '1';  -- Indicate tx_data is valid
        wait for CLK_PERIOD*2;
        tx_valid <= '0';  -- Deassert tx_valid
        wait for 8 * CLK_PERIOD;  -- Wait for remaining 8 bits to be transmitted
        ss <= '1';  -- Deactivate slave select
        wait for CLK_PERIOD;

        -- Test Case 3: ss goes high mid-transmission
        ss <= '0';  -- Activate slave select
        tx_data <= x"9ABC";  -- Set tx_data
        tx_valid <= '1';  -- Indicate tx_data is valid
        wait for CLK_PERIOD * 2;
        tx_valid <= '0';  -- Deassert tx_valid
        wait for 8 * CLK_PERIOD;  -- Wait for 8 bits to be transmitted
        ss <= '1';  -- Deactivate slave select
		  wait for CLK_PERIOD;
		  
		  ss <= '0';
		  tx_data <= x"ABCD";  -- Set tx_data
        tx_valid <= '1';  -- Indicate tx_data is valid
        wait for CLK_PERIOD*2;
        tx_valid <= '0';
		  wait until trdy = '1';
		  tx_data <= x"1234";  -- Set tx_data
        tx_valid <= '1';  -- Indicate tx_data is valid
        wait for CLK_PERIOD*2;
        tx_valid <= '0';
		  wait until trdy = '1';
		  wait for CLK_PERIOD;
		  tx_data <= x"ffff";  -- Set tx_data
        tx_valid <= '1';  -- Indicate tx_data is valid
        wait for CLK_PERIOD;
        tx_valid <= '0';
		  wait for 16*CLK_PERIOD;
		  ss <= '1';  -- Deactivate slave select
		  
		  
		  
		  
	end process;
		
end Behavioral;