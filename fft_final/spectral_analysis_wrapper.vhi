
-- VHDL Instantiation Created from source file spectral_analysis_wrapper.vhd -- 19:56:06 03/18/2025
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT spectral_analysis_wrapper
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		fifo_din : IN std_logic_vector(15 downto 0);
		fifo_wr_en : IN std_logic;          
		cm_mag_out : OUT std_logic_vector(16 downto 0);
		cm_index_out : OUT std_logic_vector(11 downto 0);
		cm_rdy : OUT std_logic
		);
	END COMPONENT;

	Inst_spectral_analysis_wrapper: spectral_analysis_wrapper PORT MAP(
		clk => ,
		rst => ,
		fifo_din => ,
		fifo_wr_en => ,
		cm_mag_out => ,
		cm_index_out => ,
		cm_rdy => 
	);


