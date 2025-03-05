library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_spi_interface is
  Port (
    rst           : in  std_logic;  -- active high reset
    sclk          : in  std_logic;  -- SPI clock (also FIFO read clock)
    ss            : in  std_logic;  -- SPI slave select, active low
    trdy          : in  std_logic;  -- SPI transmit ready from spi_slave
    cmp_result    : in  std_logic_vector(7 downto 0);  -- external compare result
    cmp_res_valid : in  std_logic;  -- when high, load cmp_result
    fifo_dout     : in  std_logic_vector(15 downto 0);  -- data from FIFO
    prog_empty    : in  std_logic;  -- '1' when FIFO has <4098 words, '0' otherwise
    rd_en         : out std_logic;  -- read enable to FIFO
    tx_data       : out std_logic_vector(15 downto 0);  -- data to SPI slave
    tx_valid      : out std_logic   -- one-cycle valid pulse to SPI slave
  );
end fifo_spi_interface;

architecture Behavioral of fifo_spi_interface is

  -- Three states: IDLE, TRANSMIT, FLUSH.
  type state_type is (IDLE, TRANSMIT, FLUSH);
  signal state       : state_type := IDLE;
  
  -- Count the words transmitted in the current burst.
  signal burst_count : integer range 0 to 4096 := 0;
  -- Count words flushed when a transmission is interrupted.
  signal flush_count : integer range 0 to 4096 := 0;
  
  -- Registered compare result; a nonzero value enables transmission.
  signal cmp_reg     : std_logic_vector(7 downto 0) := (others => '0');
  
  -- 8-bit burst identifier. Every new burst (transmission) uses a unique id.
  signal current_id  : unsigned(7 downto 0) := (others => '0');

begin

  process(sclk, rst)
  begin
    if rst = '1' then
      state       <= IDLE;
      burst_count <= 0;
      flush_count <= 0;
      cmp_reg     <= (others => '0');
      current_id  <= x"01";
      rd_en       <= '0';
      tx_valid    <= '0';
      tx_data     <= (others => '0');
      
    elsif rising_edge(sclk) then
    
      -- Capture cmp_result when valid.
      if cmp_res_valid = '1' then
         cmp_reg <= cmp_result;
      end if;
      
      -- Default outputs.
      rd_en    <= '0';
      tx_valid <= '0';
      
      case state is
        
        -------------------------------
        when IDLE =>
          -- If idle (ss high) and an incomplete burst exists with new data available,
          -- flush the old data so that it won't be sent later.
          if (ss = '1') and ((prog_empty = '0') or burst_count > 0) then
              state <= FLUSH;
              flush_count <= 0;
				  cmp_reg <= (others => '0');
              
          -- When a transmission begins (ss low) and cmp_reg is valid,
          -- send the header (id & cmp_reg) as the first word of the burst.
          elsif (ss = '0') and (cmp_reg /= "00000000") then
					tx_data <= std_logic_vector(current_id) & cmp_reg;
					tx_valid <= '1';
					burst_count <= 0;
					if current_id = x"ff" then
						current_id <= x"01";
					else
						current_id <= current_id + 1;  -- update id for the next burst
					end if;
					state <= TRANSMIT;
          end if;
          
        -------------------------------
        when TRANSMIT =>
          if ss = '1' then
              -- Transmission interrupted; return to idle.
              state <= IDLE;
          elsif ss = '0' then
              if trdy = '1' then
                  rd_en <= '1';  -- read next word from FIFO
                  tx_data <= fifo_dout;
                  tx_valid <= '1';
                  burst_count <= burst_count + 1;
                  -- If a full burst (4096 words) has been sent, clear cmp_reg and reset counters.
                  if burst_count = 4096 then
                      cmp_reg <= (others => '0');
                      burst_count <= 0;
                      state <= IDLE;
                  end if;
              end if;
          end if;
          
        -------------------------------
        when FLUSH =>
			  rd_en <= '1';  -- read (and discard) the word from FIFO
			  flush_count <= flush_count + 1;
			  -- When flushed words equal the remaining unsent words, reset counters.
			  if flush_count = (4096 - burst_count) then
					burst_count <= 0;
					flush_count <= 0;
					state <= IDLE;
			  end if;
          
      end case;
      
    end if;
  end process;

end Behavioral;
