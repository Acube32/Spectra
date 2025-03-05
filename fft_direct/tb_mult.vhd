LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_mult IS
END tb_mult;

ARCHITECTURE behavior OF tb_mult IS

  -- Component Declaration
  COMPONENT mult
    PORT (
      clk : IN STD_LOGIC;
      a   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      b   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      ce  : IN STD_LOGIC;
      p   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  -- Signal Declarations
  SIGNAL clk : STD_LOGIC := '0';
  SIGNAL a, b : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL ce : STD_LOGIC := '0';
  SIGNAL p : STD_LOGIC_VECTOR(31 DOWNTO 0);
  
  CONSTANT clk_period : TIME := 10 ns;

BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut: mult PORT MAP (
    clk => clk,
    a   => a,
    b   => b,
    ce  => ce,
    p   => p
  );

  -- Clock Process
  clk_process : PROCESS
  BEGIN
    WHILE TRUE LOOP
      clk <= '0';
      WAIT FOR clk_period/2;
      clk <= '1';
      WAIT FOR clk_period/2;
    END LOOP;
  END PROCESS;

  -- Stimulus Process
  stim_proc: PROCESS
  BEGIN
    -- Apply test vectors
    WAIT FOR 15 ns;
    ce <= '1';
    a  <= x"0003"; -- 3
    b  <= x"0004"; -- 4
    WAIT FOR clk_period;
    
    a  <= x"0007"; -- 7
    b  <= x"0002"; -- 2
    WAIT FOR clk_period;
    
    a  <= x"FFFF"; -- -1 in 2's complement
    b  <= x"0001"; -- 1
    WAIT FOR clk_period;
    
    a  <= x"8000"; -- -32768 in 2's complement
    b  <= x"0002"; -- 2
    WAIT FOR clk_period;
    
    ce <= '0';
    WAIT FOR 20 ns;
    
    -- Stop simulation
    WAIT;
  END PROCESS;

END behavior;
