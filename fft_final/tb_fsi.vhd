library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_fifo_spi_interface is
end tb_fifo_spi_interface;

architecture Behavioral of tb_fifo_spi_interface is

  -- Testbench signals to drive the UUT
  signal rst           : std_logic := '1';
  signal sclk          : std_logic := '0';
  signal ss            : std_logic := '1';
  signal trdy          : std_logic := '1';
  signal cmp_result    : std_logic_vector(7 downto 0) := (others => '0');
  signal cmp_res_valid : std_logic := '0';
  signal fifo_dout     : std_logic_vector(15 downto 0) := (others => '0');
  signal prog_empty    : std_logic := '1';

  -- Outputs from the UUT
  signal rd_en         : std_logic;
  signal tx_data       : std_logic_vector(15 downto 0);
  signal tx_valid      : std_logic;
  
  -- Internal counter used to generate FIFO data responses.
  signal fifo_counter  : unsigned(15 downto 0) := (others => '0');
  signal trdy_counter  : unsigned(15 downto 0) := (others => '0');

begin

  ----------------------------------------------------------------------
  -- Instantiate the Unit Under Test (UUT)
  ----------------------------------------------------------------------
  uut: entity work.fifo_spi_interface
    port map (
      rst           => rst,
      sclk          => sclk,
      ss            => ss,
      trdy          => trdy,
      cmp_result    => cmp_result,
      cmp_res_valid => cmp_res_valid,
      fifo_dout     => fifo_dout,
      prog_empty    => prog_empty,
      rd_en         => rd_en,
      tx_data       => tx_data,
      tx_valid      => tx_valid
    );
    
  ----------------------------------------------------------------------
  -- Clock generation: 10 ns period (5 ns low, 5 ns high)
  ----------------------------------------------------------------------
  clk_process : process
  begin
    while true loop
      sclk <= '0';
      wait for 5 ns;
      sclk <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process clk_process;

  ----------------------------------------------------------------------
  -- Reset process: Assert reset for the first 20 ns.
  ----------------------------------------------------------------------
  reset_process : process
  begin
    rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait;
  end process reset_process;
  
  ----------------------------------------------------------------------
  -- FIFO Data Generation Process
  --
  -- When the interface asserts rd_en, this process increments a counter
  -- and assigns it to fifo_dout so that each read returns a different word.
  ----------------------------------------------------------------------
  fifo_data_gen : process(sclk)
  begin
    if rising_edge(sclk) then
      if rd_en = '1' then
         fifo_counter <= fifo_counter + 1;
         fifo_dout <= std_logic_vector(fifo_counter);
      end if;
    end if;
  end process fifo_data_gen;
  
  
  ----------------------------------------------------------------------
  -- Stimulus Process
  --
  -- This process drives the cmp_result, cmp_res_valid, ss, and prog_empty
  -- signals to exercise both a normal burst transmission and a scenario
  -- where the transmission is interrupted so that the incomplete burst
  -- is flushed before a new burst begins.
  ----------------------------------------------------------------------
  stimulus_process : process
  begin
    -- Wait for reset to complete.
    wait for 30 ns;
    
    -- -----------------------------------------------
    -- First Burst Scenario
    -- -----------------------------------------------
    -- Provide a valid compare result.
    cmp_result    <= "10101010";
    cmp_res_valid <= '1';
    wait for 10 ns;
    cmp_res_valid <= '0';
    
    -- Wait a short time, then start SPI transmission by driving ss low.
    wait for 10 ns;
    ss <= '0';  -- Begin transmission (header word will be sent)
    
    -- Let the transmission run for a while (simulate several words transmitted)
    wait for 100 ns;
    
    -- Interrupt the transmission by deasserting ss.
    ss <= '1';
    wait for 50 ns;  -- Remain idle (incomplete burst pending)
    
    -- Indicate that new burst data is available:
    -- Drive prog_empty low momentarily to trigger flush of the stale data.
    prog_empty <= '0';
    wait for 20 ns;
    prog_empty <= '1';
    
    -- -----------------------------------------------
    -- Second Burst Scenario (New Burst)
    -- -----------------------------------------------
    -- Wait a little before starting new burst.
    wait for 30 ns;
    cmp_result    <= "11001100";
    cmp_res_valid <= '1';
    wait for 10 ns;
    cmp_res_valid <= '0';
    
    -- Start new transmission.
    ss <= '0';
    wait for 100 ns;
    
    -- End the transmission.
    ss <= '1';
    wait for 45000 ns;
	 
	 ss <= '0';
	 
	 
    
    -- End simulation.
    assert false report "End of simulation" severity note;
    wait;
  end process stimulus_process;
  
end Behavioral;
