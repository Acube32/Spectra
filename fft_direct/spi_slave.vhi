
-- VHDL Instantiation Created from source file spi_slave.vhd -- 16:48:42 03/04/2025
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT spi_slave
	PORT(
		sclk : IN std_logic;
		ss : IN std_logic;
		mosi : IN std_logic;
		tx_data : IN std_logic_vector(15 downto 0);
		tx_valid : IN std_logic;          
		miso : OUT std_logic;
		rx_data : OUT std_logic_vector(15 downto 0);
		rx_valid : OUT std_logic;
		trdy : OUT std_logic
		);
	END COMPONENT;

	Inst_spi_slave: spi_slave PORT MAP(
		sclk => ,
		ss => ,
		mosi => ,
		tx_data => ,
		tx_valid => ,
		miso => ,
		rx_data => ,
		rx_valid => ,
		trdy => 
	);


