LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY spectra IS
  PORT (
    rst      : IN STD_LOGIC;
    wr_clk   : IN STD_LOGIC;
    rd_clk   : IN STD_LOGIC;
    din      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en    : IN STD_LOGIC;
	 sclk     : IN STD_LOGIC;
	 ss       : IN STD_LOGIC;
	 mosi     : IN STD_LOGIC;
	 miso     : OUT STD_LOGIC;
	 dout     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END spectra;

ARCHITECTURE Structural OF spectra IS

	COMPONENT fifo
		PORT (
			rst           : IN STD_LOGIC;
			wr_clk        : IN STD_LOGIC;
			rd_clk        : IN STD_LOGIC;
			din           : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			wr_en         : IN STD_LOGIC;
			rd_en         : IN STD_LOGIC;
			dout          : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			full          : OUT STD_LOGIC;
			empty         : OUT STD_LOGIC;
			valid         : OUT STD_LOGIC;
			prog_empty    : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT fft
		PORT (
			clk          : IN STD_LOGIC;
			start        : IN STD_LOGIC;
			xn_re        : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			xn_im        : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			fwd_inv      : IN STD_LOGIC;
			fwd_inv_we   : IN STD_LOGIC;
			rfd          : OUT STD_LOGIC;
			xn_index     : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			busy         : OUT STD_LOGIC;
			edone        : OUT STD_LOGIC;
			done         : OUT STD_LOGIC;
			dv           : OUT STD_LOGIC;
			xk_index     : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			xk_re        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			xk_im        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			blk_exp      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT fifo_fft_interface
		PORT (
			rst            : IN STD_LOGIC;
			wr_clk         : IN STD_LOGIC;
			rd_clk         : IN STD_LOGIC;
			fifo_din       : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			wr_en          : IN STD_LOGIC;
			start          : OUT STD_LOGIC;
			fifo_valid     : IN STD_LOGIC;
			fifo_prog_empty: IN STD_LOGIC;
			fifo_rd_en     : OUT STD_LOGIC;
			fifo_dout      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			fft_xn_re      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			fft_xn_im      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT complex_magnitude IS
		PORT (
			clk       : IN STD_LOGIC;
			ce        : IN STD_LOGIC;
			real_in   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			imag_in   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			index_in  : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			mag_out   : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
			index_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			rdy       : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT comparator IS
		PORT (
			clk       : IN STD_LOGIC;
			reset     : IN STD_LOGIC;
			valid_in  : IN STD_LOGIC;
			data_in   : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			index_in  : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			result    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			valid_out : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT comm_fifo
		PORT (
			rst        : IN STD_LOGIC;
			wr_clk     : IN STD_LOGIC;
			rd_clk     : IN STD_LOGIC;
			din        : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			wr_en      : IN STD_LOGIC;
			rd_en      : IN STD_LOGIC;
			dout       : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			full       : OUT STD_LOGIC;
			empty      : OUT STD_LOGIC;
			valid      : OUT STD_LOGIC;
			prog_empty : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT fifo_spi_interface
		PORT(
			rst             : IN std_logic;
			sclk            : IN std_logic;
			ss              : IN std_logic;
			trdy            : IN std_logic;
			cmp_result      : IN std_logic_vector(7 downto 0);
			cmp_res_valid   : IN std_logic;
			fifo_dout       : IN std_logic_vector(15 downto 0);
			fifo_empty      : IN std_logic;
			fifo_prog_empty : IN std_logic;          
			rd_en           : OUT std_logic;
			tx_data         : OUT std_logic_vector(15 downto 0);
			tx_valid        : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT spi_slave
		PORT(
			sclk     : IN std_logic;
			ss       : IN std_logic;
			mosi     : IN std_logic;
			tx_data  : IN std_logic_vector(15 downto 0);
			tx_valid : IN std_logic;          
			miso     : OUT std_logic;
			rx_data  : OUT std_logic_vector(15 downto 0);
			rx_valid : OUT std_logic;
			trdy     : OUT std_logic
		);
	END COMPONENT;



	SIGNAL fifo_dout            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL fifo_valid           : STD_LOGIC;
	SIGNAL fifo_prog_empty      : STD_LOGIC;
	SIGNAL fifo_rd_en           : STD_LOGIC;
	
	SIGNAL fft_start            : STD_LOGIC;
	SIGNAL fft_xn_re            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL fft_xn_im            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL fft_rfd              : STD_LOGIC;
	SIGNAL fft_busy             : STD_LOGIC;
	SIGNAL fft_done             : STD_LOGIC;
	SIGNAL fft_dv               : STD_LOGIC;
	SIGNAL fft_xk_re            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL fft_xk_im            : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL fft_xk_index         : STD_LOGIC_VECTOR(11 DOWNTO 0);
	
	SIGNAL cm_index_out         : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL cm_mag               : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL cm_rdy               : STD_LOGIC;
	
	SIGNAL cmp_result           : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL cmp_res_valid        : STD_LOGIC;
	
	SIGNAL comm_fifo_empty      : STD_LOGIC;
	SIGNAL comm_fifo_prog_empty : STD_LOGIC;
	SIGNAL comm_fifo_dout       : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL comm_fifo_rd_en      : STD_LOGIC;
	
	SIGNAL spis_trdy            : STD_LOGIC;
	SIGNAL spis_tx_data         : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL spis_tx_valid        : STD_LOGIC;
	

BEGIN

	u_fifo : fifo
		PORT MAP (
			rst         => rst,
			wr_clk      => wr_clk,
			rd_clk      => rd_clk,
			din         => din,
			wr_en       => wr_en,
			rd_en       => fifo_rd_en,
			dout        => fifo_dout,
			full        => OPEN,
			empty       => OPEN,
			valid       => fifo_valid,
			prog_empty  => fifo_prog_empty
		);

	u_fifo_fft_interface : fifo_fft_interface
		PORT MAP (
			rst             => rst,
			wr_clk          => wr_clk,
			rd_clk          => rd_clk,
			fifo_din        => din,
			wr_en           => wr_en,
			start           => fft_start,
			fifo_valid      => fifo_valid,
			fifo_prog_empty => fifo_prog_empty,
			fifo_rd_en      => fifo_rd_en,
			fifo_dout       => fifo_dout,
			fft_xn_re       => fft_xn_re,
			fft_xn_im       => fft_xn_im
		);

	u_fft : fft
		PORT MAP (
			clk        => rd_clk,
			start      => fft_start,
			xn_re      => fft_xn_re,
			xn_im      => fft_xn_im,
			fwd_inv    => '1',
			fwd_inv_we => '1',
			rfd        => fft_rfd,
			xn_index   => OPEN,
			busy       => fft_busy,
			edone      => OPEN,
			done       => fft_done,
			dv         => fft_dv,
			xk_index   => fft_xk_index,
			xk_re      => fft_xk_re,
			xk_im      => fft_xk_im,
			blk_exp    => OPEN
		);
	 
	u_complex_magnitude : complex_magnitude
		PORT MAP (
			clk       => rd_clk,
			ce        => fft_dv,
			real_in   => fft_xk_re,
			imag_in   => fft_xk_im,
			index_in  => fft_xk_index,
			mag_out   => cm_mag,
			index_out => cm_index_out,
			rdy       => cm_rdy
		);
	 
	u_comparator : comparator
		PORT MAP (
			clk       => rd_clk,
			reset     => rst,
			valid_in  => cm_rdy,
			data_in   => cm_mag,
			index_in  => cm_index_out,
			result    => cmp_result,
			valid_out => cmp_res_valid
		);

	dout <= cmp_result;
		
	u_comm_fifo : comm_fifo
		PORT MAP (
			rst         => rst,
			wr_clk      => rd_clk,
			rd_clk      => rd_clk,
			din         => fifo_dout,
			wr_en       => fifo_rd_en,
			rd_en       => comm_fifo_rd_en,
			dout        => comm_fifo_dout,
			full        => OPEN,
			empty       => comm_fifo_empty,
			valid       => OPEN,
			prog_empty  => comm_fifo_prog_empty
		);
	 
	u_fifo_spi_interface: fifo_spi_interface
		PORT MAP(
			rst             => rst,
			sclk            => sclk,
			ss              => ss,
			trdy            => spis_trdy,
			cmp_result      => cmp_result,
			cmp_res_valid   => cmp_res_valid,
			fifo_dout       => comm_fifo_dout,
			fifo_empty      => comm_fifo_empty,
			fifo_prog_empty => comm_fifo_prog_empty,
			rd_en           => comm_fifo_rd_en,
			tx_data         => spis_tx_data,
			tx_valid        => spis_tx_valid
		);
	
	u_spi_slave: spi_slave 
		PORT MAP(
			sclk     => sclk,
			ss       => ss,
			mosi     => mosi,
			tx_data  => spis_tx_data,
			tx_valid => spis_tx_valid,
			miso     => miso,
			rx_data  => OPEN,
			rx_valid => OPEN,
			trdy     => spis_trdy
		);

END Structural;
