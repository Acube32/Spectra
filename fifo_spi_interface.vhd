library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Top-level entity for interfacing the FIFO with the SPI TX interface.
entity fifo_spi_ctrl is
  port(
    -- Global signals
    i_Rst_L       : in  std_logic;
    i_Clk         : in  std_logic;
    
    -- cmp_result interface (cmp_result is 8 bits)
    cmp_res_valid : in  std_logic;
    cmp_result    : in  std_logic_vector(7 downto 0);
    
    -- FIFO interface (FIFO width = 16 bits, depth = 8191)
    fifo_wr_en    : in  std_logic; -- High when a burst is being written to the FIFO
    fifo_dout     : in  std_logic_vector(15 downto 0);
    fifo_empty    : in  std_logic;
    fifo_rd_en    : out std_logic;
    
    -- SPI TX interface signals (external spi_slave will use these)
    spi_rfd       : in  std_logic;  -- Ready For Data signal for TX interface
    spi_tx_dv     : out std_logic;  -- Data Valid pulse for TX interface
    spi_tx_data   : out std_logic_vector(15 downto 0)  -- 16-bit TX data output
  );
end fifo_spi_ctrl;

architecture Behavioral of fifo_spi_ctrl is

  ----------------------------------------------------------------------
  -- State Machine Definition
  ----------------------------------------------------------------------
  type state_type is (
    IDLE,               -- Waiting for cmp_res_valid
    WAIT_RFD_HEADER,    -- Waiting for spi_rfd rising edge before sending header
    BURST_TRANSFER,     -- Transmit FIFO words (one per rising edge of spi_rfd)
    WAIT_RFD_TRAILER,   -- Waiting for spi_rfd before sending trailer word
    FLUSH_BURST         -- Flush FIFO words (without TX) until 4096 words are removed
  );
  signal state     : state_type := IDLE;
  signal counter   : integer range 0 to 4096 := 0;
  
  -- Mode: '1' means transmit mode; '0' means flush mode.
  signal tx_mode        : std_logic := '0';
  signal cmp_result_reg : std_logic_vector(7 downto 0) := (others => '0');
  
  -- Internal ID generation:
  signal id_gen  : std_logic_vector(7 downto 0) := (others => '0'); -- auto-incrementing counter
  signal id_reg  : std_logic_vector(7 downto 0) := (others => '0'); -- latched ID for current burst
  
  -- Header/Trailer word: concatenation of id_reg and cmp_result.
  signal header_word    : std_logic_vector(15 downto 0) := (others => '0');

  -- Used for rising-edge detection on spi_rfd.
  signal rfd_reg     : std_logic := '0';

  -- Internal signals to drive outputs (can also drive outputs directly).
  signal spi_tx_dv_int   : std_logic := '0';
  signal spi_tx_data_int : std_logic_vector(15 downto 0) := (others => '0');
  signal fifo_rd_en_int  : std_logic := '0';

begin

  -- Drive outputs
  spi_tx_dv   <= spi_tx_dv_int;
  spi_tx_data <= spi_tx_data_int;
  fifo_rd_en  <= fifo_rd_en_int;

  ----------------------------------------------------------------------
  -- Main State Machine Process
  --
  -- This process waits for a valid cmp_result. When cmp_result is nonzero,
  -- an internal ID is generated (and auto-incremented) and concatenated with
  -- cmp_result to form the header and trailer word. The module then either
  -- transmits 4096 FIFO words (with header and trailer) or flushes 4096 words,
  -- while checking spi_rfd before each TX.
  ----------------------------------------------------------------------
  process(i_Clk, i_Rst_L)
  begin
    if i_Rst_L = '0' then
      state           <= IDLE;
      counter         <= 0;
      spi_tx_dv_int   <= '0';
      spi_tx_data_int <= (others => '0');
      fifo_rd_en_int  <= '0';
      tx_mode         <= '0';
      cmp_result_reg  <= (others => '0');
      id_gen          <= (others => '0');
      id_reg          <= (others => '0');
      header_word     <= (others => '0');
      rfd_reg         <= '0';
      
    elsif rising_edge(i_Clk) then
      -- Latch previous spi_rfd value for rising edge detection.
      rfd_reg <= spi_rfd;
      -- Default assignments for outputs.
      spi_tx_dv_int   <= '0';
      fifo_rd_en_int  <= '0';

      case state is
        ------------------------------------------------------------------------------
        when IDLE =>
          counter <= 0;
          -- Wait for a valid cmp_result signal.
          if cmp_res_valid = '1' then
            cmp_result_reg <= cmp_result;
            -- Check cmp_result: if nonzero, generate an ID and enter transmit mode;
            -- otherwise, flush the FIFO burst.
            if cmp_result /= x"00" then
              id_reg       <= id_gen;             -- Latch current ID
              header_word  <= id_gen & cmp_result;  -- Form header/trailer word
              id_gen       <= std_logic_vector(unsigned(id_gen) + 1);  -- Increment for next burst
              tx_mode      <= '1';  -- Transmit mode
              state        <= WAIT_RFD_HEADER;
            else
              tx_mode      <= '0';  -- Flush mode
              state        <= FLUSH_BURST;
            end if;
          end if;
          
        ------------------------------------------------------------------------------
        when WAIT_RFD_HEADER =>
          -- If FIFO write enable goes high, switch to flush mode.
          if fifo_wr_en = '1' then
            state <= FLUSH_BURST;
          -- Wait for a rising edge on spi_rfd before sending header.
          elsif (spi_rfd = '1' and rfd_reg = '0') then
            spi_tx_data_int <= header_word;
            spi_tx_dv_int   <= '1';
            state           <= BURST_TRANSFER;
          end if;
          
        ------------------------------------------------------------------------------
        when BURST_TRANSFER =>
          -- If FIFO write enable goes high during burst, switch to flush mode.
          if fifo_wr_en = '1' then
            state <= FLUSH_BURST;
          elsif counter < 4096 then
            -- Wait for a rising edge on spi_rfd before sending each FIFO word.
            if (spi_rfd = '1' and rfd_reg = '0') then
              if fifo_empty = '0' then
                spi_tx_data_int <= fifo_dout;
                spi_tx_dv_int   <= '1';
                fifo_rd_en_int  <= '1';
                counter <= counter + 1;
              end if;
              if counter = 4095 then
                state <= WAIT_RFD_TRAILER;
              end if;
            end if;
          end if;
          
        ------------------------------------------------------------------------------
        when WAIT_RFD_TRAILER =>
          -- Wait for rising edge on spi_rfd before sending trailer word.
          if (spi_rfd = '1' and rfd_reg = '0') then
            spi_tx_data_int <= header_word;
            spi_tx_dv_int   <= '1';
            state           <= IDLE;
          end if;
          
        ------------------------------------------------------------------------------
        when FLUSH_BURST =>
          -- In flush mode, simply flush FIFO words (assert fifo_rd_en)
          fifo_rd_en_int <= '1';
          counter <= counter + 1;
          if counter = 4096 then
            state <= IDLE;
          end if;
          
        when others =>
          state <= IDLE;
      end case;
    end if;
  end process;

end Behavioral;
