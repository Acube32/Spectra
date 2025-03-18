LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY tb_fifo IS
END tb_fifo;

ARCHITECTURE behavior OF tb_fifo IS

  -- Component Declaration for the FIFO
  COMPONENT fifo
    PORT (
      rst : IN STD_LOGIC;
      wr_clk : IN STD_LOGIC;
      rd_clk : IN STD_LOGIC;
      din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      wr_en : IN STD_LOGIC;
      rd_en : IN STD_LOGIC;
      dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      full : OUT STD_LOGIC;
      empty : OUT STD_LOGIC;
      valid : OUT STD_LOGIC
    );
  END COMPONENT;

  -- Signals
  SIGNAL rst      : STD_LOGIC := '0';
  SIGNAL wr_clk   : STD_LOGIC := '0';
  SIGNAL rd_clk   : STD_LOGIC := '0';
  SIGNAL din      : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL wr_en    : STD_LOGIC := '0';
  SIGNAL rd_en    : STD_LOGIC := '0';
  SIGNAL dout     : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL full     : STD_LOGIC;
  SIGNAL empty    : STD_LOGIC;
  SIGNAL valid    : STD_LOGIC;

  -- Clock Generation
  CONSTANT WR_CLK_PERIOD : TIME := 100 ns;
  CONSTANT RD_CLK_PERIOD : TIME := 10 ns;

BEGIN
  -- Instantiate the FIFO
  uut: fifo PORT MAP (
    rst    => rst,
    wr_clk => wr_clk,
    rd_clk => rd_clk,
    din    => din,
    wr_en  => wr_en,
    rd_en  => rd_en,
    dout   => dout,
    full   => full,
    empty  => empty,
    valid  => valid
  );

  -- Generate Write Clock
  wr_clk_process : PROCESS
  BEGIN
    LOOP
      wr_clk <= '0';
      WAIT FOR WR_CLK_PERIOD / 2;
      wr_clk <= '1';
      WAIT FOR WR_CLK_PERIOD / 2;
    END LOOP;
    WAIT;
  END PROCESS;

  -- Generate Read Clock
  rd_clk_process : PROCESS
  BEGIN
    LOOP
      rd_clk <= '0';
      WAIT FOR RD_CLK_PERIOD / 2;
      rd_clk <= '1';
      WAIT FOR RD_CLK_PERIOD / 2;
    END LOOP;
    WAIT;
  END PROCESS;

  -- Stimulus Process
  stimulus_process : PROCESS
  BEGIN
    -- Reset FIFO
    rst <= '1';
    WAIT FOR 50 ns;
    rst <= '0';
    WAIT FOR 50 ns;
    
    -- Write Data to FIFO
	 wr_en <= '1';
	 WAIT FOR WR_CLK_PERIOD * 3;
    FOR i IN 1 TO 4098 LOOP
      din   <= CONV_STD_LOGIC_VECTOR(i, 16);
      WAIT FOR WR_CLK_PERIOD;
    END LOOP;
    wr_en <= '0';
    WAIT FOR 100 ns;
    
	 rd_en <= '1';

    WAIT;
  END PROCESS;
END behavior;
