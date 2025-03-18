LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY spectra IS
  PORT (
    rst      : IN STD_LOGIC;
    clk   : IN STD_LOGIC;
    din      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	 din_valid: IN STD_LOGIC;
	 dout     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END spectra;

ARCHITECTURE Structural OF spectra IS
	
	component filter
		port (
			clk: in std_logic;
			nd: in std_logic;
			rfd: out std_logic;
			rdy: out std_logic;
			din: in std_logic_vector(15 downto 0);
			dout: out std_logic_vector(15 downto 0));
	end component;
	
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

	COMPONENT comparator IS
		GENERIC (
			i : integer
		);
		PORT (
			clk       : IN STD_LOGIC;
			reset     : IN STD_LOGIC;
			valid_in  : IN STD_LOGIC;
			data_in   : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			index_in  : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			result    : OUT STD_LOGIC;
			valid_out : OUT STD_LOGIC
		);
	END COMPONENT;
	
	

	SIGNAL filt_100_rfd             : STD_LOGIC;
	SIGNAL filt_100_rdy             : STD_LOGIC;
	SIGNAL filt_100_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL filt_280_rfd             : STD_LOGIC;
	SIGNAL filt_280_rdy             : STD_LOGIC;
	SIGNAL filt_280_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL filt_625_rfd             : STD_LOGIC;
	SIGNAL filt_625_rdy             : STD_LOGIC;
	SIGNAL filt_625_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL filt_1_2k_rfd             : STD_LOGIC;
	SIGNAL filt_1_2k_rdy             : STD_LOGIC;
	SIGNAL filt_1_2k_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL filt_2k_rfd             : STD_LOGIC;
	SIGNAL filt_2k_rdy             : STD_LOGIC;
	SIGNAL filt_2k_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL filt_3_5k_rfd             : STD_LOGIC;
	SIGNAL filt_3_5k_rdy             : STD_LOGIC;
	SIGNAL filt_3_5k_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL filt_6_5k_rfd             : STD_LOGIC;
	SIGNAL filt_6_5k_rdy             : STD_LOGIC;
	SIGNAL filt_6_5k_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL filt_40k_rfd             : STD_LOGIC;
	SIGNAL filt_40k_rdy             : STD_LOGIC;
	SIGNAL filt_40k_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	SIGNAL cm_100_index_out         : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_100_mag               : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_100_rdy               : STD_LOGIC;
	SIGNAL cm_280_index_out         : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_280_mag               : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_280_rdy               : STD_LOGIC;
	SIGNAL cm_625_index_out         : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_625_mag               : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_625_rdy               : STD_LOGIC;
	SIGNAL cm_1_2k_index_out        : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_1_2k_mag              : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_1_2k_rdy              : STD_LOGIC;
	SIGNAL cm_2k_index_out          : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_2k_mag                : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_2k_rdy                : STD_LOGIC;
	SIGNAL cm_3_5k_index_out        : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_3_5k_mag              : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_3_5k_rdy              : STD_LOGIC;
	SIGNAL cm_6_5k_index_out        : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_6_5k_mag              : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_6_5k_rdy              : STD_LOGIC;
	SIGNAL cm_40k_index_out         : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_40k_mag               : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_40k_rdy               : STD_LOGIC;
	
	
	SIGNAL cmp_res_valid        : STD_LOGIC;
	
	SIGNAL cmp_100_result       : STD_LOGIC;
	SIGNAL cmp_280_result       : STD_LOGIC;
	SIGNAL cmp_625_result       : STD_LOGIC;
	SIGNAL cmp_1_2k_result       : STD_LOGIC;
	SIGNAL cmp_2k_result       : STD_LOGIC;
	SIGNAL cmp_3_5k_result       : STD_LOGIC;
	SIGNAL cmp_6_5k_result       : STD_LOGIC;
	SIGNAL cmp_40k_result       : STD_LOGIC;

	

BEGIN

	u_filter_100Hz : filter
		port map (
			clk => clk,
			nd => din_valid,
			rfd => filt_100_rfd,
			rdy => filt_100_rdy,
			din => din,
			dout => filt_100_dout
		);
	
	u_spectral_analysis_wrapper_100Hz: spectral_analysis_wrapper 
		PORT MAP(
			clk => clk,
			rst => rst,
			fifo_din => filt_100_dout,
			fifo_wr_en => filt_100_rdy,
			cm_mag_out => cm_100_mag,
			cm_index_out => cm_100_index_out,
			cm_rdy => cm_100_rdy
		);
	
	u_comparator_100Hz : comparator
		GENERIC MAP (
			i => 0
		)
		PORT MAP (
			clk       => clk,
			reset     => rst,
			valid_in  => cm_100_rdy,
			data_in   => cm_100_mag,
			index_in  => cm_100_index_out,
			result    => cmp_100_result,
			valid_out => OPEN
		);
		
		u_filter_280Hz : filter
		port map (
			clk => clk,
			nd => din_valid,
			rfd => filt_280_rfd,
			rdy => filt_280_rdy,
			din => din,
			dout => filt_280_dout
		);
	
	u_spectral_analysis_wrapper_280Hz: spectral_analysis_wrapper 
		PORT MAP(
			clk => clk,
			rst => rst,
			fifo_din => filt_280_dout,
			fifo_wr_en => filt_280_rdy,
			cm_mag_out => cm_280_mag,
			cm_index_out => cm_280_index_out,
			cm_rdy => cm_280_rdy
		);
	
	u_comparator_280Hz : comparator
		GENERIC MAP (
			i => 1
			)
		PORT MAP (
			clk       => clk,
			reset     => rst,
			valid_in  => cm_280_rdy,
			data_in   => cm_280_mag,
			index_in  => cm_280_index_out,
			result    => cmp_280_result,
			valid_out => OPEN
		);
		
		u_filter_625Hz : filter
		port map (
			clk => clk,
			nd => din_valid,
			rfd => filt_625_rfd,
			rdy => filt_625_rdy,
			din => din,
			dout => filt_625_dout
		);
	
	u_spectral_analysis_wrapper_625Hz: spectral_analysis_wrapper 
		PORT MAP(
			clk => clk,
			rst => rst,
			fifo_din => filt_625_dout,
			fifo_wr_en => filt_625_rdy,
			cm_mag_out => cm_625_mag,
			cm_index_out => cm_625_index_out,
			cm_rdy => cm_625_rdy
		);
	
	u_comparator_625Hz : comparator
		GENERIC MAP (
			i => 2
		)
		PORT MAP (
			clk       => clk,
			reset     => rst,
			valid_in  => cm_625_rdy,
			data_in   => cm_625_mag,
			index_in  => cm_625_index_out,
			result    => cmp_625_result,
			valid_out => OPEN
		);
	
	u_filter_1_2kHz : filter
		port map (
			clk => clk,
			nd => din_valid,
			rfd => filt_1_2k_rfd,
			rdy => filt_1_2k_rdy,
			din => din,
			dout => filt_1_2k_dout
		);
	
	u_spectral_analysis_wrapper_1_2kHz: spectral_analysis_wrapper 
		PORT MAP(
			clk => clk,
			rst => rst,
			fifo_din => filt_1_2k_dout,
			fifo_wr_en => filt_1_2k_rdy,
			cm_mag_out => cm_1_2k_mag,
			cm_index_out => cm_1_2k_index_out,
			cm_rdy => cm_1_2k_rdy
		);
	
	u_comparator_1_2kHz : comparator
		GENERIC MAP (
			i => 3
		)
		PORT MAP (
			clk       => clk,
			reset     => rst,
			valid_in  => cm_1_2k_rdy,
			data_in   => cm_1_2k_mag,
			index_in  => cm_1_2k_index_out,
			result    => cmp_1_2k_result,
			valid_out => OPEN
		);
		
		u_filter_2kHz : filter
		port map (
			clk => clk,
			nd => din_valid,
			rfd => filt_2k_rfd,
			rdy => filt_2k_rdy,
			din => din,
			dout => filt_2k_dout
		);
	
	u_spectral_analysis_wrapper_2kHz: spectral_analysis_wrapper 
		PORT MAP(
			clk => clk,
			rst => rst,
			fifo_din => filt_2k_dout,
			fifo_wr_en => filt_2k_rdy,
			cm_mag_out => cm_2k_mag,
			cm_index_out => cm_2k_index_out,
			cm_rdy => cm_2k_rdy
		);
	
	u_comparator_2kHz : comparator
		GENERIC MAP (
			i => 4
		)
		PORT MAP (
			clk       => clk,
			reset     => rst,
			valid_in  => cm_2k_rdy,
			data_in   => cm_2k_mag,
			index_in  => cm_2k_index_out,
			result    => cmp_2k_result,
			valid_out => OPEN
		);

	u_filter_3_5kHz : filter
		port map (
			clk => clk,
			nd => din_valid,
			rfd => filt_3_5k_rfd,
			rdy => filt_3_5k_rdy,
			din => din,
			dout => filt_3_5k_dout
		);
	
	u_spectral_analysis_wrapper_3_5kHz: spectral_analysis_wrapper 
		PORT MAP(
			clk => clk,
			rst => rst,
			fifo_din => filt_3_5k_dout,
			fifo_wr_en => filt_3_5k_rdy,
			cm_mag_out => cm_3_5k_mag,
			cm_index_out => cm_3_5k_index_out,
			cm_rdy => cm_3_5k_rdy
		);
	
	u_comparator_3_5kHz : comparator
		GENERIC MAP (
			i => 5
		)
		PORT MAP (
			clk       => clk,
			reset     => rst,
			valid_in  => cm_3_5k_rdy,
			data_in   => cm_3_5k_mag,
			index_in  => cm_3_5k_index_out,
			result    => cmp_3_5k_result,
			valid_out => OPEN
		);

	u_filter_6_5kHz : filter
		port map (
			clk => clk,
			nd => din_valid,
			rfd => filt_6_5k_rfd,
			rdy => filt_6_5k_rdy,
			din => din,
			dout => filt_6_5k_dout
		);
	
	u_spectral_analysis_wrapper_6_5kHz: spectral_analysis_wrapper 
		PORT MAP(
			clk => clk,
			rst => rst,
			fifo_din => filt_6_5k_dout,
			fifo_wr_en => filt_6_5k_rdy,
			cm_mag_out => cm_6_5k_mag,
			cm_index_out => cm_6_5k_index_out,
			cm_rdy => cm_6_5k_rdy
		);
	
	u_comparator_6_5kHz : comparator
		GENERIC MAP (
			i => 6
		)
		PORT MAP (
			clk       => clk,
			reset     => rst,
			valid_in  => cm_6_5k_rdy,
			data_in   => cm_6_5k_mag,
			index_in  => cm_6_5k_index_out,
			result    => cmp_6_5k_result,
			valid_out => OPEN
		);

	u_filter_40kHz : filter
		port map (
			clk => clk,
			nd => din_valid,
			rfd => filt_40k_rfd,
			rdy => filt_40k_rdy,
			din => din,
			dout => filt_40k_dout
		);
	
	u_spectral_analysis_wrapper_40kHz: spectral_analysis_wrapper 
		PORT MAP(
			clk => clk,
			rst => rst,
			fifo_din => filt_40k_dout,
			fifo_wr_en => filt_40k_rdy,
			cm_mag_out => cm_40k_mag,
			cm_index_out => cm_40k_index_out,
			cm_rdy => cm_40k_rdy
		);
	
	u_comparator_40kHz : comparator
		GENERIC MAP (
			i => 7
		)
		PORT MAP (
			clk       => clk,
			reset     => rst,
			valid_in  => cm_40k_rdy,
			data_in   => cm_40k_mag,
			index_in  => cm_40k_index_out,
			result    => cmp_40k_result,
			valid_out => cmp_res_valid
		);

	dout <= cmp_40k_result & cmp_6_5k_result & cmp_3_5k_result & cmp_2k_result & cmp_1_2k_result & cmp_625_result & cmp_280_result & cmp_100_result;
		
END Structural;
