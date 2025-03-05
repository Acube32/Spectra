library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spi_slave is
    Port (
        sclk     : in  STD_LOGIC;  -- SPI clock
        ss       : in  STD_LOGIC;  -- Slave select (active low)
        mosi     : in  STD_LOGIC;  -- Master Out Slave In
        tx_data  : in  STD_LOGIC_VECTOR(15 downto 0);  -- Data to transmit
        tx_valid : in  STD_LOGIC;  -- Indicates tx_data is valid
        miso     : out STD_LOGIC;  -- Master In Slave Out
        rx_data  : out STD_LOGIC_VECTOR(15 downto 0);  -- Received data
        rx_valid : out STD_LOGIC;  -- Indicates rx_data is valid
        trdy     : out STD_LOGIC   -- Transmit ready
    );
end spi_slave;

architecture Behavioral of spi_slave is
    signal shift_reg_tx : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');  -- Shift register for transmission
    signal shift_reg_rx : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');  -- Shift register for reception
    signal bit_count    : INTEGER range 0 to 15 := 0;  -- Bit counter
    signal tx_active    : STD_LOGIC := '0';  -- Indicates if transmission is active
    signal tx_ready     : STD_LOGIC := '1';  -- Indicates if ready to transmit new data
	 signal prev_ss      : STD_LOGIC := '1';
	 signal latched      : STD_LOGIC := '0';
begin

    process(sclk, ss)
    begin
        if ss = '1' then  -- Slave select is high (inactive)
            bit_count <= 0;  -- Reset bit counter
            tx_active <= '0';  -- Transmission is inactive
            tx_ready <= '1';  -- Ready to accept new data
            miso <= 'Z';  -- Tri-state miso
				prev_ss <= '1';
        elsif falling_edge(sclk) then
            if tx_active = '0' then  -- Start new transmission
					if tx_valid = '1' then
						shift_reg_tx <= tx_data;
						tx_active <= '1'; 
						tx_ready <= '0';
					elsif tx_ready = '1' then
						shift_reg_tx <= (others => '0');
						tx_active <= '1'; 
						tx_ready <= '0';
					end if;
            else -- Transmission is active
                miso <= shift_reg_tx(15);  -- Output MSB of shift register
                shift_reg_tx <= shift_reg_tx(14 downto 0) & '0';  -- Shift left
                bit_count <= bit_count + 1;  -- Increment bit counter

                if bit_count = 15 then  -- Transmission complete
                    tx_active <= '0';  -- Transmission is inactive
						  bit_count <= 0;
					 end if;
					 if bit_count = 14 then
                    tx_ready <= '1';  -- Ready to accept new data
                end if;
            end if;
				
				if tx_ready = '1' and bit_count = 15 and tx_valid = '1' then
					shift_reg_tx <= tx_data;
					tx_active <= '1'; 
					tx_ready <= '0';
				end if;
        end if;
    end process;

    process(sclk, ss)
    begin
        if ss = '1' then  -- Slave select is high (inactive)
            shift_reg_rx <= (others => '0');  -- Reset receive shift register
            rx_valid <= '0';  -- Received data is not valid
        elsif rising_edge(sclk) then  -- On rising edge of sclk
            shift_reg_rx <= shift_reg_rx(14 downto 0) & mosi;  -- Shift in mosi data
            if bit_count = 15 then  -- Reception complete
                rx_data <= shift_reg_rx(14 downto 0) & mosi;  -- Store received data
                rx_valid <= '1';  -- Received data is valid
            else
                rx_valid <= '0';  -- Received data is not valid
            end if;
        end if;
    end process;

    trdy <= tx_ready;  -- Output transmit ready signal

end Behavioral;