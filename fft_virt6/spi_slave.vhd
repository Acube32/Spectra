library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spi_slave is
    Port (
        sclk     : in  std_logic;
        mosi     : in  std_logic;
        miso     : out std_logic;
        ss_n     : in  std_logic;
        data_in  : in  std_logic_vector(15 downto 0);  -- Data to send
        data_out : out std_logic_vector(15 downto 0);  -- Received data
        valid    : out std_logic;                      -- High when new data is received
        ready    : out std_logic                       -- High when ready for new data_in
    );
end spi_slave;

architecture Behavioral of spi_slave is
    signal shift_reg : std_logic_vector(15 downto 0) := (others => '0');
    signal bit_count : integer range 0 to 15 := 0;
    signal miso_reg  : std_logic := '0';
    signal data_ready : std_logic := '1';

begin
    process (sclk)
    begin
        if rising_edge(sclk) then
            if ss_n = '0' then  -- Active low slave select
                shift_reg <= shift_reg(14 downto 0) & mosi;
                if bit_count = 15 then
                    data_out <= shift_reg(14 downto 0) & mosi;
                    valid <= '1';
                    data_ready <= '1'; -- Ready for new data_in after a complete frame
                else
                    valid <= '0';
                    data_ready <= '0'; -- Not ready while receiving
                end if;
                bit_count <= (bit_count + 1) mod 16;
            else
                bit_count <= 0;
                valid <= '0';
                data_ready <= '1'; -- Ready when not selected
            end if;
        end if;
    end process;
    
    process (sclk)
    begin
        if falling_edge(sclk) then
            if ss_n = '0' then
                miso_reg <= data_in(15 - bit_count);
            end if;
        end if;
    end process;
    
    miso  <= miso_reg;
    ready <= data_ready;

end Behavioral;
