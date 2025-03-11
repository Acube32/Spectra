------------------------------------------------------------------------------/
-- Description:       Simple test bench for SPI Master module
------------------------------------------------------------------------------/
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_spi_master is
end entity tb_spi_master;

architecture testbench of tb_spi_master is

  constant SPI_MODE : integer := 3; -- CPOL = 1, CPHA = 1
  constant CLKS_PER_HALF_BIT : integer := 4;  -- 6.25 MHz
  
  signal r_Rst_L    : std_logic := '0';
  signal w_SPI_Clk  : std_logic;
  signal r_Clk      : std_logic := '0';
  signal w_SPI_MOSI : std_logic;
  
  -- Master Specific
  signal r_Master_TX_Data  : std_logic_vector(15 downto 0) := X"0000";
  signal r_Master_TX_DV    : std_logic := '0';
  signal r_Master_CS_n     : std_logic := '1';
  signal w_Master_TX_Ready : std_logic;
  signal r_Master_RX_DV    : std_logic := '0';
  signal r_Master_RX_Data  : std_logic_vector(15 downto 0) := X"0000";
  
  -- Sends a single Data from master. 
  procedure SendSingleData (
    data          : in  std_logic_vector(15 downto 0);
    signal o_data : out std_logic_vector(15 downto 0);
    signal o_dv   : out std_logic) is
  begin
    wait until rising_edge(r_Clk);
    o_data <= data;
    o_dv   <= '1';
    wait until rising_edge(r_Clk);
    o_dv   <= '0';
    wait until rising_edge(w_Master_TX_Ready);
  end procedure SendSingleData;

begin  -- architecture testbench

   -- Clock Generators:
  r_Clk <= not r_Clk after 2 ns;

  -- Instantiate Master
  UUT : entity work.spi_master
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
      o_TX_Ready => w_Master_TX_Ready,         -- Transmit Ready for Data
      -- RX (MISO) Signals
      o_RX_DV    => r_Master_RX_DV,            -- Data Valid pulse
      o_RX_Data  => r_Master_RX_Data,          -- Data received on MISO
      -- SPI Interface
      o_SPI_Clk  => w_SPI_Clk, 
      i_SPI_MISO => w_SPI_MOSI,
      o_SPI_MOSI => w_SPI_MOSI
      );
      
  Testing : process is
  begin
    wait for 100 ns;
    r_Rst_L <= '0';
    wait for 100 ns;
    r_Rst_L <= '1';
    
    -- Test single Data
    SendSingleData(X"C188", r_Master_TX_Data, r_Master_TX_DV);
--    report "Sent out 0xC188, Received 0x" & to_hstring(unsigned(r_Master_RX_Data));
      
    -- Test double Data
    SendSingleData(X"BE21", r_Master_TX_Data, r_Master_TX_DV);
--    report "Sent out 0xBE21, Received 0x" & to_hstring(unsigned(r_Master_RX_Data));

    SendSingleData(X"EFF1", r_Master_TX_Data, r_Master_TX_DV);
--    report "Sent out 0xEFF1, Received 0x" & to_hstring(unsigned(r_Master_RX_Data));
    wait for 50 ns;
    assert false report "Test Complete" severity failure;
  end process Testing;

end architecture testbench;
