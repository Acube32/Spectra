----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:47:43 03/18/2025 
-- Design Name: 
-- Module Name:    spectral_analysis_wrapper - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spectral_analysis_wrapper is
	port(
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		fifo_din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		fifo_wr_en : IN STD_LOGIC;
		cm_mag_out   : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
		cm_index_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		cm_rdy       : OUT STD_LOGIC
	);
end spectral_analysis_wrapper;

architecture Behavioral of spectral_analysis_wrapper is
	COMPONENT fifo
		PORT (
			clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			wr_en : IN STD_LOGIC;
			rd_en : IN STD_LOGIC;
			dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			full : OUT STD_LOGIC;
			empty : OUT STD_LOGIC;
			valid : OUT STD_LOGIC;
			prog_empty : OUT STD_LOGIC
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
			rd_clk         : IN STD_LOGIC;
			fifo_din       : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
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
	
begin

	u_fifo : fifo
		PORT MAP (
			clk => clk,
			rst => rst,
			din => fifo_din,
			wr_en => fifo_wr_en,
			rd_en => fifo_rd_en,
			dout => fifo_dout,
			full => OPEN,
			empty =>  OPEN,
			valid => fifo_valid,
			prog_empty => fifo_prog_empty
		);
  
	u_fifo_fft_interface : fifo_fft_interface
		PORT MAP (
			rst             => rst,
			rd_clk          => clk,
			fifo_din        => fifo_din,
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
			clk        => clk,
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
			clk       => clk,
			ce        => fft_dv,
			real_in   => fft_xk_re,
			imag_in   => fft_xk_im,
			index_in  => fft_xk_index,
			mag_out   => cm_mag_out,
			index_out => cm_index_out,
			rdy       => cm_rdy
		);
end Behavioral;

