--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:31:33 03/08/2025
-- Design Name:   
-- Module Name:   /home/ise/Desktop/fft_direct/tb_spi.vhd
-- Project Name:  fft_direct
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: spi_slave
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_spi IS
END tb_spi;
 
ARCHITECTURE behavior OF tb_spi IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
	COMPONENT spi_slave
	GENERIC(
		SPI_MODE : INTEGER);
	PORT(
		i_Rst_L : IN  std_logic;
		i_Clk : IN  std_logic;
		o_RX_DV : OUT  std_logic;
		o_RX_Data : OUT  std_logic_vector(15 downto 0);
		i_TX_DV : IN  std_logic;
		i_TX_Data : IN  std_logic_vector(15 downto 0);
		i_SPI_Clk : IN  std_logic;
		o_SPI_MISO : OUT  std_logic;
		i_SPI_MOSI : IN  std_logic;
		i_SPI_CS_n : IN  std_logic;
		o_rfd : OUT  std_logic
	  );
	END COMPONENT;
    
	constant SPI_MODE : integer := 3; -- CPOL = 1, CPHA = 1
	constant CLKS_PER_HALF_BIT : integer := 2;

   signal r_Rst_L : std_logic := '0';
   signal r_Clk : std_logic := '0';
   signal r_Master_TX_DV : std_logic := '0';
   signal r_Master_TX_Data : std_logic_vector(15 downto 0) := (others => '0');
	signal r_Master_TX_Ready : std_logic;
	signal r_Master_RX_DV : std_logic;
   signal r_Master_RX_Data : std_logic_vector(15 downto 0);
	
   signal w_SPI_Clk : std_logic;
   signal w_SPI_MOSI : std_logic;
	signal w_SPI_MISO : std_logic;
   signal r_SPI_CS_n : std_logic;
	
	signal r_Slave_TX_DV : std_logic := '0';
   signal r_Slave_TX_Data : std_logic_vector(15 downto 0) := (others => '0');
	signal r_Slave_RX_DV : std_logic;
   signal r_Slave_RX_Data : std_logic_vector(15 downto 0);
   signal r_Slave_rfd : std_logic;

   -- Clock period definitions
   constant r_Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: spi_slave 
		GENERIC MAP (
			SPI_MODE          => SPI_MODE)
		PORT MAP (
          i_Rst_L => r_Rst_L,
          i_Clk => r_Clk,
          o_RX_DV => r_Slave_RX_DV,
          o_RX_Data => r_Slave_RX_Data,
          i_TX_DV => r_Slave_TX_DV,
          i_TX_Data => r_Slave_TX_Data,
          i_SPI_Clk => w_SPI_Clk,
          o_SPI_MISO => w_SPI_MISO,
          i_SPI_MOSI => w_SPI_MOSI,
          i_SPI_CS_n => r_SPI_CS_n,
          o_rfd => r_Slave_rfd
	   );
		
	u_spi_master : entity work.spi_master
    generic map (
      SPI_MODE          => SPI_MODE,
      CLKS_PER_HALF_BIT => CLKS_PER_HALF_BIT)
    port map (
      -- Control/Data Signals,
      i_Rst_L    => r_Rst_L,            -- FPGA Reset
      i_Clk      => r_Clk,              -- FPGA Clock
      -- TX (MOSI) Signals
      i_TX_Data  => r_Master_TX_Data,          -- Data to transmit
      i_TX_DV    => r_Master_TX_DV,            -- Data Valid pulse
      o_TX_Ready => r_Master_TX_Ready,         -- Transmit Ready for Data
      -- RX (MISO) Signals
      o_RX_DV    => r_Master_RX_DV,            -- Data Valid pulse
      o_RX_Data  => r_Master_RX_Data,          -- Data received on MISO
      -- SPI Interface
      o_SPI_Clk  => w_SPI_Clk, 
      i_SPI_MISO => w_SPI_MISO,
      o_SPI_MOSI => w_SPI_MOSI
      );

   -- Clock process definitions
   r_Clk_process :process
   begin
		r_Clk <= '0';
		wait for r_Clk_period/2;
		r_Clk <= '1';
		wait for r_Clk_period/2;
   end process;


   -- Stimulus process
   stim_master_proc: process
   begin		
      -- hold reset state for 100 ns.
		r_Rst_L <= '0';
		r_SPI_CS_n <= '1';
		r_Slave_TX_Dv <= '0';
      wait for 100 ns;	
		r_Rst_L <= '1';
		
		r_SPI_CS_n <= '0';
		r_Slave_TX_Dv <= '1';
		r_Slave_TX_Data <= x"1234";
		r_Master_TX_Data <= x"4321";
		r_Slave_TX_DV <= '1';
		r_Master_TX_DV <= '1';
		wait for r_Clk_period;
		r_Slave_TX_DV <= '0';
		r_Master_TX_DV <= '0';
		
		wait until r_Master_TX_Ready='1';
		wait for r_Clk_period;
		
		r_SPI_CS_n <= '1';
		r_Slave_TX_Dv <= '0';
      wait for r_Clk_period;
		
		r_SPI_CS_n <= '0';
		r_Slave_TX_Dv <= '1';
		r_Slave_TX_Data <= x"abcd";
		r_Master_TX_Data <= x"dcba";
		r_Slave_TX_DV <= '1';
		r_Master_TX_DV <= '1';
		wait for r_Clk_period;
		r_Slave_TX_DV <= '0';
		r_Master_TX_DV <= '0';
		
		wait until r_Master_TX_Ready='1';
		wait for r_Clk_period;
		
		r_Slave_TX_Dv <= '1';
		r_Slave_TX_Data <= x"634f";
		r_Master_TX_Data <= x"31e1";
		r_Slave_TX_DV <= '1';
		r_Master_TX_DV <= '1';
		wait for r_Clk_period;
		r_Slave_TX_DV <= '0';
		r_Master_TX_DV <= '0';
		
		
		for i in 0 to 10 loop
			wait until r_Master_TX_Ready = '1';
			wait for r_Clk_period;
			r_Master_TX_DV <= '1';
			wait for r_Clk_period;
			r_Master_TX_DV <= '0';
		end loop;
		
      wait for r_Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;
	

END;
