LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY tb_spectra_spi IS
END tb_spectra_spi;

ARCHITECTURE Behavioral OF tb_spectra_spi IS

  CONSTANT clk_period  : TIME := 10 ns;  -- 100 MHz clock
  CONSTANT sample_rate : INTEGER := 100000;
  CONSTANT num_samples : INTEGER := 15000;
  
  -- Define a REAL array type for frequencies
  TYPE REAL_ARRAY IS ARRAY (0 TO 7) OF REAL;
  CONSTANT freqs : REAL_ARRAY := (100.0, 280.0, 625.0, 1200.0, 2000.0, 3500.0, 6500.0, 40000.0);
  CONSTANT SPI_MODE : integer := 3; -- CPOL = 1, CPHA = 1
  CONSTANT CLKS_PER_HALF_BIT : integer := 2;   
  
  SIGNAL rst      : STD_LOGIC := '1';
  SIGNAL rst_l    : STD_LOGIC := '0';
  SIGNAL wr_clk   : STD_LOGIC := '0';
  SIGNAL rd_clk   : STD_LOGIC := '0';
  SIGNAL din      : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL wr_en    : STD_LOGIC := '0';
  SIGNAL sclk     : STD_LOGIC;
  SIGNAL ss       : STD_LOGIC := '1';
  SIGNAL mosi     : STD_LOGIC := '0';
  SIGNAL miso     : STD_LOGIC;
  SIGNAL dout     : STD_LOGIC_VECTOR(7 DOWNTO 0);
  
  SIGNAL clk      : STD_LOGIC := '0';
  SIGNAL tx_dv    : STD_LOGIC := '0';
  SIGNAL tx_ready : STD_LOGIC;
  SIGNAL rx_dv    : STD_LOGIC;
  SIGNAL rx_data  : STD_LOGIC_VECTOR(15 DOWNTO 0);
  
  

  COMPONENT spectra
    PORT (
		rst      : IN STD_LOGIC;
		wr_clk   : IN STD_LOGIC;
		rd_clk   : IN STD_LOGIC;
		din      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		wr_en    : IN STD_LOGIC;
		sclk     : IN STD_LOGIC;
		ss       : IN STD_LOGIC;
		mosi     : IN STD_LOGIC;
		miso     : OUT STD_LOGIC;
		dout     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT;

BEGIN

  -- Instantiate the top-level module
  UUT : spectra
    PORT MAP (
      rst     => rst,
      wr_clk  => wr_clk,
      rd_clk  => rd_clk,
      din     => din,
      wr_en   => wr_en,
		sclk    => sclk,
      ss      => ss,
      mosi    => mosi,
      miso    => miso,
      dout  => dout
    );
	 
	 u_spi_master : entity work.spi_master
    generic map (
      SPI_MODE          => SPI_MODE,
      CLKS_PER_HALF_BIT => CLKS_PER_HALF_BIT)
    port map (
      -- Control/Data Signals,
      i_Rst_L    => rst_l,            -- FPGA Reset
      i_Clk      => clk,              -- FPGA Clock
      -- TX (MOSI) Signals
      i_TX_Data  => x"0000",          -- Data to transmit
      i_TX_DV    => tx_dv,            -- Data Valid pulse
      o_TX_Ready => tx_ready,         -- Transmit Ready for Data
      -- RX (MISO) Signals
      o_RX_DV    => rx_dv,            -- Data Valid pulse
      o_RX_Data  => rx_data,          -- Data received on MISO
      -- SPI Interface
      o_SPI_Clk  => sclk, 
      i_SPI_MISO => miso,
      o_SPI_MOSI => mosi
      );
  
  rst_l <= not rst;
  
  
  -- Clock Generation
  PROCESS
  BEGIN
    WAIT FOR clk_period/2;
    wr_clk <= NOT wr_clk;
  END PROCESS;

  PROCESS
  BEGIN
    WAIT FOR clk_period / 64;
    rd_clk <= NOT rd_clk;
  END PROCESS;
  
  PROCESS
  BEGIN
    WAIT FOR clk_period / 64;
    clk <= NOT clk;
  END PROCESS;

  -- Stimulus Process
  PROCESS
    VARIABLE sample_index : INTEGER := 0;
    VARIABLE sine_value   : REAL;
    VARIABLE total_signal : REAL;
    VARIABLE scaled_value : INTEGER;
  BEGIN
    -- Reset sequence
    rst <= '1';
    WAIT FOR 100 ns;
    rst <= '0';
	 ss  <= '0';
    
    FOR i IN 0 TO num_samples - 1 LOOP
      total_signal := 0.0;
      
      -- Compute the sum of 8 sine waves
      FOR j IN 0 TO 7 LOOP
        total_signal := total_signal + SIN(2.0 * MATH_PI * freqs(j) * REAL(i) / REAL(sample_rate));
      END LOOP;
      
      -- Normalize the signal to fit within 16-bit range
      total_signal := total_signal / 8.0; -- Prevent overflow
      scaled_value := INTEGER(total_signal * 32767.0);
      
      din <= CONV_STD_LOGIC_VECTOR(scaled_value, 16);
      wr_en <= '1';
      WAIT FOR clk_period;
    END LOOP;
    
    wr_en <= '0';
    WAIT;
  END PROCESS;
  
  process(clk)
  begin
	tx_dv <= '0';
	if tx_ready = '1' and ss = '0' then
		tx_dv <= '1';
	end if;
  end process;

END Behavioral;