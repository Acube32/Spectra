LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.math_real.ALL;

ENTITY tb_fft IS
END tb_fft;

ARCHITECTURE behavior OF tb_fft IS

  -- Component Declaration for the FFT IP
  COMPONENT fft
    PORT (
      clk : IN STD_LOGIC;
      start : IN STD_LOGIC;
      xn_re : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      xn_im : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      fwd_inv : IN STD_LOGIC;
      fwd_inv_we : IN STD_LOGIC;
      rfd : OUT STD_LOGIC;
      xn_index : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      busy : OUT STD_LOGIC;
      edone : OUT STD_LOGIC;
      done : OUT STD_LOGIC;
      dv : OUT STD_LOGIC;
      xk_index : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      xk_re : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      xk_im : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      blk_exp : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
  END COMPONENT;

  -- Signals
  SIGNAL clk : STD_LOGIC := '0';
  SIGNAL start : STD_LOGIC := '0';
  SIGNAL xn_re, xn_im : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL fwd_inv : STD_LOGIC := '1';
  SIGNAL fwd_inv_we : STD_LOGIC := '1';
  SIGNAL rfd, busy, edone, done, dv : STD_LOGIC;
  SIGNAL xn_index, xk_index : STD_LOGIC_VECTOR(11 DOWNTO 0);
  SIGNAL xk_re, xk_im : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL blk_exp : STD_LOGIC_VECTOR(4 DOWNTO 0);
  
  CONSTANT clk_period : TIME := 1000 ns; -- 1 MHz clock
  CONSTANT sample_period : TIME := 10 us; -- 100 KHz sample rate
  CONSTANT Fs : REAL := 100_000.0;
  CONSTANT Fsig : REAL := 100.0;
  CONSTANT pi : REAL := 3.14159265359;

BEGIN
  -- Instantiate the FFT Unit
  uut: fft PORT MAP (
    clk => clk,
    start => start,
    xn_re => xn_re,
    xn_im => xn_im,
    fwd_inv => fwd_inv,
    fwd_inv_we => fwd_inv_we,
    rfd => rfd,
    xn_index => xn_index,
    busy => busy,
    edone => edone,
    done => done,
    dv => dv,
    xk_index => xk_index,
    xk_re => xk_re,
    xk_im => xk_im,
    blk_exp => blk_exp
  );
  
  -- Clock Process
  clk_process : PROCESS
  BEGIN
    WHILE TRUE LOOP
      clk <= '0';
      WAIT FOR clk_period / 2;
      clk <= '1';
      WAIT FOR clk_period / 2;
    END LOOP;
  END PROCESS;

  -- Stimulus Process
  stim_process : PROCESS
    VARIABLE n : INTEGER := 0;
    VARIABLE signal_real : REAL;
  BEGIN
    -- Wait for reset
    WAIT FOR 100 ns;
    start <= '1';
    
    -- Generate a 40 kHz sine wave sampled at 100 kHz
    FOR n IN 0 TO 4095 LOOP
      signal_real := 32767.0 * SIN(2.0 * pi * Fsig * real(n) / Fs);
      xn_re <= CONV_STD_LOGIC_VECTOR(INTEGER(signal_real), 16);
      xn_im <= (OTHERS => '0'); -- No imaginary component
      WAIT FOR clk_period;
    END LOOP;
    
    start <= '0';
    WAIT;
  END PROCESS;

END behavior;
