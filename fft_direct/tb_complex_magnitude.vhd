LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_complex_magnitude IS
END tb_complex_magnitude;

ARCHITECTURE behavior OF tb_complex_magnitude IS

  -- Component Declaration
  COMPONENT complex_magnitude IS
	 PORT (
		clk       : IN STD_LOGIC;
		ce        : IN STD_LOGIC;
		real_in   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		imag_in   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		index_in  : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		mag_out   : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
		index_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		rdy       : OUT STD_LOGIC
	 );
  END COMPONENT;

  -- Signal Declarations
  SIGNAL clk       : STD_LOGIC := '0';
  SIGNAL ce        : STD_LOGIC := '0';
  SIGNAL real_in   : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL imag_in   : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_in  : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL mag_out   : STD_LOGIC_VECTOR(16 DOWNTO 0);
  SIGNAL index_out : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL rdy       : STD_LOGIC;
  
  CONSTANT clk_period : TIME := 10 ns;

BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut: complex_magnitude PORT MAP (
    clk     => clk,
    ce      => ce,
    real_in => real_in,
    imag_in => imag_in,
	 index_in => index_in,
    mag_out => mag_out,
	 index_out => index_out,
    rdy     => rdy
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
    WAIT FOR 20 ns;
    ce <= '1';
    
    -- Test Case 1: (3, 4) => Magnitude should be 5
    real_in <= x"0003";
    imag_in <= x"0004";
	 index_in <= x"001";
    WAIT FOR clk_period;
    
    -- Test Case 2: (5, 12) => Magnitude should be 13
    real_in <= x"0005";
    imag_in <= x"000C";
	 index_in <= x"002";
    WAIT FOR clk_period;
    
    -- Test Case 3: (8, 15) => Magnitude should be 17
    real_in <= x"0008";
    imag_in <= x"000F";
	 index_in <= x"003";
    WAIT FOR clk_period;
    
    -- Test Case 4: (7, 24) => Magnitude should be 25
    real_in <= x"0007";
    imag_in <= x"0018";
	 index_in <= x"004";
    WAIT FOR clk_period;
    
    -- Test Case 5: Edge case (0, 0) => Magnitude should be 0
    real_in <= x"0000";
    imag_in <= x"0000";
	 index_in <= x"005";
    WAIT FOR clk_period;
    
    ce <= '0';
    WAIT FOR 20 ns;
    
    -- Stop simulation
    WAIT;
  END PROCESS;

END behavior;
