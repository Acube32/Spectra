library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity declaration with a generic for SPI_MODE and an additional o_rfd output.
entity spi_slave is
	generic(
		SPI_MODE : integer := 0 -- Valid values: 0, 1, 2, or 3.
	);
	port(
		-- Control/Data Signals
		i_Rst_L   : in  std_logic;                         -- Active low reset
		i_Clk     : in  std_logic;                         -- FPGA clock
		o_RX_DV   : out std_logic;                         -- One-cycle Data Valid pulse
		o_RX_Data : out std_logic_vector(15 downto 0);       -- Data received from MOSI
		i_TX_DV   : in  std_logic;                         -- Data Valid pulse for TX byte
		i_TX_Data : in  std_logic_vector(15 downto 0);       -- Data to send on MISO

		-- SPI Interface
		i_SPI_Clk  : in  std_logic;                        -- SPI clock
		o_SPI_MISO : out std_logic;                        -- SPI MISO (tri-stated when not active)
		i_SPI_MOSI : in  std_logic;                        -- SPI MOSI
		i_SPI_CS_n : in  std_logic;                        -- Active low chip select

		-- New output: Ready For Data signal for TX interface.
		o_rfd      : out std_logic
	);
end spi_slave;

architecture Behavioral of spi_slave is

	-- SPI Mode settings:
	-- CPOL: Clock polarity = '1' when idle high (for modes 2 & 3)
	-- CPHA: Clock phase = '1' when sampling on trailing edge (for modes 1 & 3)
	constant w_CPOL : boolean := (SPI_MODE = 2) or (SPI_MODE = 3);
	constant w_CPHA : boolean := (SPI_MODE = 1) or (SPI_MODE = 3);

	-- Internal signal declarations.
	signal w_SPI_Clk         : std_logic;
	signal r_RX_Bit_Count    : unsigned(3 downto 0) := (others => '0');
	signal r_TX_Bit_Count    : unsigned(3 downto 0) := (others => '0');
	signal r_Temp_RX_Data    : std_logic_vector(15 downto 0) := (others => '0');
	signal r_RX_Data         : std_logic_vector(15 downto 0) := (others => '0');
	signal r_RX_Done         : std_logic := '0';
	signal r2_RX_Done        : std_logic := '0';
	signal r3_RX_Done        : std_logic := '0';
	signal r_TX_Data         : std_logic_vector(15 downto 0) := (others => '0');
	signal r_TX_Active       : std_logic := '0';
	signal r2_TX_Active      : std_logic := '0';
	signal r3_TX_Active      : std_logic := '0';
	signal r_SPI_CS_n        : std_logic := '1';
	signal r1_SPI_CS_n       : std_logic := '1';
	signal r_SPI_MISO_Bit    : std_logic := '0';
	signal r_Preload_MISO    : std_logic := '1';

	signal w_SPI_MISO_Mux    : std_logic;

begin

	-- Derive the SPI clock used for sampling/transmitting.
	-- If CPHA = '1' then invert the input SPI clock.
	w_SPI_Clk <= (not i_SPI_Clk) when w_CPHA else i_SPI_Clk;

	--------------------------------------------------------------------
	-- Process: Recover SPI Data in the SPI clock domain.
	-- Samples MOSI on the proper edge and shifts in data.
	--------------------------------------------------------------------
	process(w_SPI_Clk, i_SPI_CS_n)
		variable count   : unsigned(3 downto 0);
		variable temp_rx : std_logic_vector(15 downto 0);
	begin
		if i_SPI_CS_n = '1' then
			-- When CS is high: reset receive counters and clear temp data.
			r_RX_Bit_Count <= (others => '0');
			r_RX_Done      <= '0';
			r_Temp_RX_Data <= (others => '0');
		elsif rising_edge(w_SPI_Clk) then
			count   := r_RX_Bit_Count;
			temp_rx := r_Temp_RX_Data;
			-- Shift in the new bit (LSB last, shifting left)
			temp_rx := temp_rx(14 downto 0) & i_SPI_MOSI;
			if count = "1111" then
				r_RX_Done  <= '1';
				-- Capture the received data (MSB is the last bit received)
				r_RX_Data  <= temp_rx;
			elsif count = "0010" then
				r_RX_Done  <= '0';
			end if;
			r_Temp_RX_Data <= temp_rx;
			r_RX_Bit_Count <= count + 1;
		end if;
	end process;

	--------------------------------------------------------------------
	-- Process: Cross clock domain from SPI clock to main FPGA clock.
	-- Generates a one-clock-cycle Data Valid pulse (o_RX_DV) when a byte is ready.
	--------------------------------------------------------------------
	process(i_Clk, i_Rst_L)
	begin
		if i_Rst_L = '0' then
			r2_RX_Done <= '0';
			r3_RX_Done <= '0';
			o_RX_DV    <= '0';
			o_RX_Data  <= (others => '0');
		elsif rising_edge(i_Clk) then
			r2_RX_Done <= r_RX_Done;
			r3_RX_Done <= r2_RX_Done;
			if (r3_RX_Done = '0' and r2_RX_Done = '1') then
				o_RX_DV   <= '1'; -- Pulse for one clock cycle
				o_RX_Data <= r_RX_Data;
			else
				o_RX_DV <= '0';
			end if;
		end if;
	end process;

	--------------------------------------------------------------------
	-- Process: Control preload signal for MISO.
	-- When CS is high the preload is asserted, then cleared on the first SPI clock edge.
	--------------------------------------------------------------------
	process(w_SPI_Clk, i_SPI_CS_n)
	begin
		if i_SPI_CS_n = '1' then
			r_Preload_MISO <= '1';
		elsif rising_edge(w_SPI_Clk) then
			r_Preload_MISO <= '0';
		end if;
	end process;

	--------------------------------------------------------------------
	-- Process: Transmit SPI Data.
	-- Shifts out the TX data one bit at a time on MISO.
	-- Note: When CS is high the slave is idle so r_TX_Active is cleared.
	--------------------------------------------------------------------
	process(w_SPI_Clk, i_SPI_CS_n)
	begin
		if i_SPI_CS_n = '1' then
			-- Idle state: reset bit counter and clear active flag.
			r_TX_Bit_Count <= "1111";  -- (MSB index)
			r_SPI_MISO_Bit <= r_TX_Data(15);
			r_TX_Active    <= '0';
		elsif rising_edge(w_SPI_Clk) then
			-- On first clock after CS goes low, start transmission.
			if r_TX_Bit_Count = "1111" then
				r_TX_Active <= '1';
			end if;
			-- If we've shifted out all bits, clear active flag.
			if r_TX_Bit_Count = "0000" then
				r_TX_Active <= '0';

			end if;
			
			r_TX_Bit_Count <= r_TX_Bit_Count - 1;
			r_SPI_MISO_Bit <= r_TX_Data(to_integer(r_TX_Bit_Count));

		end if;
	end process;

	--------------------------------------------------------------------
	-- Process: Generate o_rfd (Ready For Data) in the i_Clk clock domain.
	-- o_rfd goes high when CS is high (i.e. no SPI transfer in progress) or when,
	-- with CS active, the transmission of the previous TX word is complete.
	--------------------------------------------------------------------
	process(i_Clk, i_Rst_L)
	begin
		if i_Rst_L = '0' then
			r2_TX_Active <= '0';
			r3_TX_Active <= '0';
			r_SPI_CS_n   <= '1';
			r1_SPI_CS_n  <= '1';
			o_rfd        <= '1';  -- Ready by default after reset.
		elsif rising_edge(i_Clk) then
			-- Synchronize the asynchronous signals.
			r_SPI_CS_n  <= i_SPI_CS_n;
			r1_SPI_CS_n <= r_SPI_CS_n;
			r2_TX_Active <= r_TX_Active;
			r3_TX_Active <= r2_TX_Active;
			
			-- When chip select is inactive (high), the slave is idle.
			-- When CS is low, the module is ready to accept new TX data only if no transmission is active.
			if i_SPI_CS_n = '1' then
				o_rfd <= '1';
			elsif r3_TX_Active = '0' then
				o_rfd <= '1';
			else
				o_rfd <= '0';
			end if;
		end if;
	end process;

	--------------------------------------------------------------------
	-- Process: Register TX Data in the main clock domain.
	-- Latches the transmit data when the TX Data Valid pulse is received.
	--------------------------------------------------------------------
	process(i_Clk, i_Rst_L)
	begin
		if i_Rst_L = '0' then
			r_TX_Data <= (others => '0');
		elsif rising_edge(i_Clk) then
			if i_TX_DV = '1' then
				r_TX_Data <= i_TX_Data;
			end if;
		end if;
	end process;

	--------------------------------------------------------------------
	-- MISO output multiplexer and tri-state control.
	-- When the preload signal is asserted, drive the MSB of the TX data.
	-- Otherwise, drive the selected bit.
	-- When CS is high, MISO is tri-stated.
	--------------------------------------------------------------------
	w_SPI_MISO_Mux <= r_TX_Data(15) when r_Preload_MISO = '1' else r_SPI_MISO_Bit;
	o_SPI_MISO <= 'Z' when i_SPI_CS_n = '1' else w_SPI_MISO_Mux;

end Behavioral;
