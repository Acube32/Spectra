LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tb_spi_slave_fifo IS
END tb_spi_slave_fifo;

ARCHITECTURE testbench OF tb_spi_slave_fifo IS
  SIGNAL rst          : STD_LOGIC := '1';
  SIGNAL wr_clk       : STD_LOGIC := '0';
  SIGNAL rd_clk       : STD_LOGIC := '0';
  SIGNAL sclk         : STD_LOGIC := '0';
  SIGNAL mosi         : STD_LOGIC := '0';
  SIGNAL miso         : STD_LOGIC;
  SIGNAL ss           : STD_LOGIC := '1';
  SIGNAL comp_result  : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL res_valid    : STD_LOGIC := '0';
  SIGNAL fifo_empty   : STD_LOGIC := '1';
  SIGNAL fifo_valid   : STD_LOGIC := '0';
  SIGNAL fifo_dout    : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL fifo_rd_en   : STD_LOGIC;

  CONSTANT clk_period : TIME := 10 ns;
  
  COMPONENT spi_slave_fifo
    PORT (
      rst          : IN  STD_LOGIC;
      wr_clk       : IN  STD_LOGIC;
      rd_clk       : IN  STD_LOGIC;
      sclk         : IN  STD_LOGIC;
      mosi         : IN  STD_LOGIC;
      miso         : OUT STD_LOGIC;
      ss           : IN  STD_LOGIC;
      comp_result  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      res_valid    : IN  STD_LOGIC;
      fifo_empty   : IN  STD_LOGIC;
      fifo_valid   : IN  STD_LOGIC;
      fifo_dout    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
      fifo_rd_en   : OUT STD_LOGIC
    );
  END COMPONENT;

BEGIN
  -- Instantiate DUT
  uut: spi_slave_fifo
    PORT MAP (
      rst          => rst,
      wr_clk       => wr_clk,
      rd_clk       => rd_clk,
      sclk         => sclk,
      mosi         => mosi,
      miso         => miso,
      ss           => ss,
      comp_result  => comp_result,
      res_valid    => res_valid,
      fifo_empty   => fifo_empty,
      fifo_valid   => fifo_valid,
      fifo_dout    => fifo_dout,
      fifo_rd_en   => fifo_rd_en
    );
  
  -- Clock generation
  PROCESS
  BEGIN
    WHILE TRUE LOOP
      wr_clk <= '0';
      WAIT FOR clk_period/2;
      wr_clk <= '1';
      WAIT FOR clk_period/2;
    END LOOP;
  END PROCESS;
  
  PROCESS
  BEGIN
    WHILE TRUE LOOP
      rd_clk <= '0';
      WAIT FOR clk_period/2;
      rd_clk <= '1';
      WAIT FOR clk_period/2;
    END LOOP;
  END PROCESS;
  
  PROCESS
  BEGIN
    WHILE TRUE LOOP
      sclk <= '0';
      WAIT FOR clk_period/4;
      sclk <= '1';
      WAIT FOR clk_period/4;
    END LOOP;
  END PROCESS;
  
  PROCESS
  BEGIN
    WAIT FOR 20 ns;
    rst <= '0';
    
    -- Test case 1: comp_result has ones, data should be sent
    WAIT FOR 50 ns;
    comp_result <= "00000011";
    res_valid <= '1';
    fifo_empty <= '0';
    fifo_valid <= '1';
    fifo_dout <= X"ABCD";
    WAIT FOR 10 ns;
    res_valid <= '0';
    
    -- Test case 2: comp_result is zero, data should be read but not sent
    WAIT FOR 500 ns;
    comp_result <= "00000000";
    res_valid <= '1';
    fifo_empty <= '0';
    fifo_valid <= '1';
    fifo_dout <= X"1234";
    WAIT FOR 10 ns;
    res_valid <= '0';
    
    -- Simulation stop
    WAIT FOR 2000 ns;
    REPORT "Testbench complete";
    WAIT;
  END PROCESS;
END testbench;
