
-- VHDL Instantiation Created from source file fifo_spi_interface.vhd -- 16:42:38 03/04/2025
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT fifo_spi_interface
	PORT(
		rst : IN std_logic;
		sclk : IN std_logic;
		ss : IN std_logic;
		trdy : IN std_logic;
		cmp_result : IN std_logic_vector(7 downto 0);
		cmp_res_valid : IN std_logic;
		fifo_dout : IN std_logic_vector(15 downto 0);
		prog_empty : IN std_logic;          
		rd_en : OUT std_logic;
		tx_data : OUT std_logic_vector(15 downto 0);
		tx_valid : OUT std_logic
		);
	END COMPONENT;

	Inst_fifo_spi_interface: fifo_spi_interface PORT MAP(
		rst => ,
		sclk => ,
		ss => ,
		trdy => ,
		cmp_result => ,
		cmp_res_valid => ,
		fifo_dout => ,
		prog_empty => ,
		rd_en => ,
		tx_data => ,
		tx_valid => 
	);


