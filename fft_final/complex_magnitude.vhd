LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY complex_magnitude IS
  PORT (
    clk     : IN STD_LOGIC;
    ce      : IN STD_LOGIC;
    real_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    imag_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    index_in : IN STD_LOGIC_VECTOR(11 DOWNTO 0); -- Input index
    mag_out : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
    index_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0); -- Output index
    rdy     : OUT STD_LOGIC
  );
END complex_magnitude;

ARCHITECTURE Behavioral OF complex_magnitude IS
  
  COMPONENT mult
    PORT (
      clk : IN STD_LOGIC;
      a   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      b   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      ce  : IN STD_LOGIC;
      p   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;
  
  COMPONENT sqrt
    PORT (
      x_in  : IN STD_LOGIC_VECTOR(32 DOWNTO 0);
      nd    : IN STD_LOGIC;
      x_out : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
      rdy   : OUT STD_LOGIC;
      clk   : IN STD_LOGIC
    );
  END COMPONENT;
  
  SIGNAL real_sq, imag_sq : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL sum_squares : STD_LOGIC_VECTOR(32 DOWNTO 0);
  SIGNAL sqrt_rdy : STD_LOGIC;
  SIGNAL sqrt_rdy_delayed : STD_LOGIC;
  SIGNAL nd_reg : STD_LOGIC := '0';
  SIGNAL index_reg_1 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_2 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_3 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_4 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_5 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_6 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_7 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_8 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_9 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL index_reg_10 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');


BEGIN
  -- Instantiate multipliers
  mult_real: mult PORT MAP (
    clk => clk,
    a   => real_in,
    b   => real_in,
    ce  => ce,
    p   => real_sq
  );

  mult_imag: mult PORT MAP (
    clk => clk,
    a   => imag_in,
    b   => imag_in,
    ce  => ce,
    p   => imag_sq
  );

  -- Sum squares
  sum_squares <= ('0' & real_sq) + ('0' & imag_sq);

  -- Control logic for nd
  process (clk)
  begin
    if rising_edge(clk) then
      if ce = '1' then
		  index_reg_1 <= index_in; -- Store input index
        nd_reg <= '1';  -- Start sqrt operation
      elsif sqrt_rdy = '1' then
        nd_reg <= '0';  -- Reset nd once sqrt completes
      end if;
    end if;
  end process;

  -- Instantiate square root module
  sqrt_inst: sqrt PORT MAP (
    x_in  => sum_squares,
    nd    => nd_reg,
    x_out => mag_out,
    rdy   => sqrt_rdy,
    clk   => clk
  );

  -- Ready signal
  rdy <= sqrt_rdy;

  -- Output index assignment
  process (clk)
  begin
    if rising_edge(clk) then
		index_reg_2  <= index_reg_1;
		index_reg_3  <= index_reg_2;
		index_reg_4  <= index_reg_3;
		index_reg_5  <= index_reg_4;
		index_reg_6  <= index_reg_5;
		index_reg_7  <= index_reg_6;
		index_reg_8  <= index_reg_7;
		index_reg_9  <= index_reg_8;
		index_reg_10 <= index_reg_9;
		index_out    <= index_reg_10;  
    end if;
  end process;

END Behavioral;
