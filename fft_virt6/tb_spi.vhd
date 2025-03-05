LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY spi_slave IS
  PORT (
    sclk      : IN  STD_LOGIC;  -- SPI clock from master
    rst   : IN  STD_LOGIC;  -- Active low reset
    ss      : IN  STD_LOGIC;  -- Active low slave select
    mosi      : IN  STD_LOGIC;  -- Master out, slave in
    tx_data   : IN  STD_LOGIC_VECTOR(15 DOWNTO 0); -- Data to send
    miso      : OUT STD_LOGIC   -- Master in, slave out
  );
END spi_slave;

ARCHITECTURE behavior OF spi_slave IS
  SIGNAL tx_buf  : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL bit_cnt : INTEGER RANGE 0 TO 15 := 0;
BEGIN
  PROCESS(sclk, rst)
  BEGIN
    IF rst = '0' THEN
      tx_buf  <= (OTHERS => '0');
      bit_cnt <= 0;
      miso    <= 'Z';
    ELSIF rising_edge(sclk) THEN
      IF ss = '0' THEN  -- Active transaction
        IF bit_cnt = 0 THEN
          tx_buf <= tx_data;  -- Load new data at start
        END IF;
        miso <= tx_buf(15 - bit_cnt);
        IF bit_cnt < 15 THEN
          bit_cnt <= bit_cnt + 1;
        ELSE
          bit_cnt <= 0;
        END IF;
      ELSE
        bit_cnt <= 0;
        miso    <= 'Z';  -- Release bus when not selected
      END IF;
    END IF;
  END PROCESS;
END behavior;
