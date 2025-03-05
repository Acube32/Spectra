LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY comparator IS
  PORT (
    clk       : IN STD_LOGIC;
    reset     : IN STD_LOGIC;
    valid     : IN STD_LOGIC;
    data_in   : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
	 index_in  : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    result    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END comparator;

ARCHITECTURE Behavioral OF comparator IS
  
  TYPE int_array IS ARRAY(0 TO 7) OF INTEGER;
  CONSTANT COMP_VALUES : int_array := (4, 11, 26, 49, 82, 143, 266, 1638);
  

  SIGNAL result_reg : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  CONSTANT THRESHOLD : STD_LOGIC_VECTOR(16 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(10000, 17);

BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      result_reg <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF valid = '1' THEN
        -- Check if current counter matches any of the selected indices
        FOR i IN 0 TO 7 LOOP
          IF index_in = COMP_VALUES(i) THEN
            IF data_in > THRESHOLD THEN
              result_reg(i) <= '1';
            ELSE
              result_reg(i) <= '0';
            END IF;
          END IF;
        END LOOP;
      END IF;
    END IF;
  END PROCESS;

  result <= result_reg;

END Behavioral;