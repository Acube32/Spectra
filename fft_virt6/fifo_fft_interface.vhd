LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY fifo_fft_interface IS
  PORT (
    rst        : IN STD_LOGIC;
    wr_clk     : IN STD_LOGIC;
    rd_clk     : IN STD_LOGIC;
    fifo_din   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en      : IN STD_LOGIC;
    start      : OUT STD_LOGIC;

    
    -- FIFO Signals
    fifo_valid     : IN STD_LOGIC;
    fifo_prog_empty: IN STD_LOGIC;
    fifo_rd_en     : OUT STD_LOGIC;
    fifo_dout      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);

    -- FFT Signals
    fft_xn_re      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    fft_xn_im      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END fifo_fft_interface;

ARCHITECTURE Behavioral OF fifo_fft_interface IS
  SIGNAL read_counter  : INTEGER RANGE 0 TO 4096 := 0;
  SIGNAL reading       : STD_LOGIC := '0';
  SIGNAL start_signal  : STD_LOGIC := '0';
BEGIN
  PROCESS (rd_clk, rst)
  BEGIN
    IF rst = '1' THEN
      fifo_rd_en   <= '0';
      start_signal <= '0';
      read_counter <= 0;
      reading      <= '0';
    ELSIF rising_edge(rd_clk) THEN
      -- Start reading when more than 4096 samples are in FIFO
      IF fifo_prog_empty = '0' AND reading = '0' THEN
        reading <= '1';
      END IF;
      
      -- Read 4096 samples into FFT
      IF reading = '1' THEN
        fifo_rd_en   <= '1';
		  IF start_signal = '0' AND read_counter = 0 THEN
				start_signal <= '1';
		  END IF;
        fft_xn_re    <= fifo_dout;
        fft_xn_im    <= (OTHERS => '0'); -- Assuming real input
        read_counter <= read_counter + 1;
        
        -- Stop reading after 4096 samples
        IF read_counter = 4095 THEN
          reading      <= '0';
          fifo_rd_en   <= '0';
          read_counter <= 0;
        END IF;
      ELSE
        fifo_rd_en <= '0';
      END IF;
      
      -- Reset start signal after one clock cycle
      IF start_signal = '1' THEN
        start_signal <= '0';
      END IF;
    END IF;
  END PROCESS;
  
  start <= start_signal;

END Behavioral;
