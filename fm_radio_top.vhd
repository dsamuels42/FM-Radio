library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.fm_package.all;
use work.calc_const.all;

entity fm_radio_top is
port
(
	signal clock : in std_logic;
	signal reset : in std_logic;
	signal IQ : in std_logic_vector (2*DATA_SIZE-1 downto 0);
	signal output_l : out std_logic_vector (DATA_SIZE-1 downto 0);
	signal output_r : out std_logic_vector (DATA_SIZE-1 downto 0)
);
end entity fm_radio_top;

architecture behavior of fm_radio_top is

--signal IQ : std_logic_vector(2*DATA_SIZE-1 downto 0);
signal I, Q, I_demod, Q_demod, demod_out: std_logic_vector(DATA_SIZE-1 downto 0);
signal demod_start,demod_done: std_logic;
signal fifo0_full, fifo0_empty, fifo1_full, fifo1_empty, fifo2_full, fifo2_empty, fifo3_full, fifo3_empty : std_logic;
signal fifo0_out, fifo1_out, fifo2_out, fifo3_out : std_logic_vector(DATA_SIZE-1 downto 0);
signal fir_L0_out, fir_L1_out, fir_L2_out, fir_L3_out, fir_R0_out : std_logic_vector(DATA_SIZE-1 downto 0);
signal fir_L0_valid, fir_L1_valid, fir_L2_valid, fir_L3_valid, fir_R0_valid : std_logic;
signal mult_L0_out, mult_L1_out : std_logic_vector(DATA_SIZE-1 downto 0);
signal add_out, sub_out, gainL_out, gainR_out : std_logic_vector(DATA_SIZE-1 downto 0);
signal deemph_L_out, deemph_R_out : std_logic_vector(DATA_SIZE-1 downto 0);


begin


----------------------------------------------------------
-- part 1 
-- input -> READ IQ -> FIR Cmlx -> demod -> fifo0
-----------------------------------------------------------
read_iq0: component read_iq
port map (
	clock => clock,
	reset => reset,
	IQ => IQ,
	I => I,
	Q => Q
);

fir_complex0: component fir_complex
generic map (
	TAPS => CHANNEL_COEFF_TAPS,
	REAL_COEFF => CHANNEL_COEFFS_REAL,
	IMAG_COEFF => CHANNEL_COEFFS_IMAG
)
port map (
	clock => clock,
	reset => reset,
	x_real => I,
	x_imag => Q,
	y_real => I_demod,
	y_imag => Q_demod
);

demod0: component demod
port map (
	clock => clock,
	reset => reset,
	start => demod_start,
	I => I_demod,
	Q => Q_demod,
	demod_out => demod_out,
	done => demod_done
);

fifo0 : component fifo
generic map(16, 16)
	port map (clock, clock, reset, demod_done, '1', 
		demod_out, fifo0_out, fifo0_full, fifo0_empty);


--part 2 - left preprocessing
-- fifo0 -> fir -> multB (must wait for othe path) -> fir -> fifo 2
-- fifo0 -> fir -> multA -> fir -> multB
-----------------------------------------------------


--fir -> mult -> fir on top of block diagram path 
fir_L0 : component fir
	generic map(BP_LMR_COEFF_TAPS, 1, BP_LMR_COEFFS)
	port map(clock, reset, fifo0_out, fir_L0_out, fir_L0_valid);
	
mult_L0 : component mult
	port map(clock, reset, fir_L0_out, fir_L2_out, mult_L0_out);
	
fir_L3 : component fir
	generic map(AUDIO_LMR_COEFF_TAPS, AUDIO_DECIM, AUDIO_LMR_COEFFS)
	port map(clock, reset, mult_L0_out, fir_L3_out, fir_L3_valid);

--fir -> mult -> fir -> mult on bottom of block diagram path
fir_L1 : component fir
	generic map(BP_PILOT_COEFF_TAPS, 1, BP_PILOT_COEFFS)
	port map(clock,reset, fifo0_out, fir_L1_out, fir_L1_valid);

mult_L1 : component mult port map(clock, reset, fir_L1_out, fir_L1_out, 
	mult_L1_out);

fir_L2 : component fir
	generic map(HP_COEFF_TAPS, 1, HP_COEFFS)
	port map(clock, reset, mult_L1_out, fir_L2_out, fir_L2_valid);



fifo1 : component fifo port map(clock, clock, reset, fir_L3_valid, '1', 
	fir_L3_out, fifo1_out, fifo1_full, fifo1_empty);
	
	
-----------------------------------------------------------------------
--part 3 -- right preprocessing
--fifo 1 -> fir -> fifo 3
----------------------------------------------------------------
	
	
	fir_R0 : component fir 
	generic map(AUDIO_LPR_COEFF_TAPS, AUDIO_DECIM, AUDIO_LPR_COEFFS)
	port map(clock ,reset, fifo0_out, fir_R0_out, fir_R0_valid);
	
	fifo2 : component fifo port map(clock, clock, reset, fir_R0_valid, '1', fir_R0_out, 
	fifo2_out ,fifo2_full, fifo2_empty);
	
	
--------------------------------------------------
--part 4 , wait for fifo2 and fifo 3 to be ready
----------------------------------------------
add0 : component add_sub port map(clock, reset, '0', fifo1_out, fifo2_out, add_out);

deemph_L : component de_emphasis 
	generic map (IIR_COEFF_TAPS, 1, (QUANTIZE_F(0.0), QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0)))),
		(QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0))),QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0)))),
		AUDIO_SAMPLES)
	port map(clock, reset, add_out, deemph_L_out);
	
gainL : component gain port map(clock, reset, deemph_L_out, gainL_out);
	
	

sub0 : component add_sub port map(clock, reset, '1', fifo1_out, fifo2_out, sub_out);

deemph_R : component de_emphasis 
	generic map (IIR_COEFF_TAPS, 1, (QUANTIZE_F(0.0), QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0)))),
		(QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0))),QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0)))),
		AUDIO_SAMPLES)
	port map(clock, reset,sub_out, deemph_R_out );

gainR : component gain port map(clock, reset, deemph_R_out, gainR_out);
	
output_l <= gainL_out;
output_r <= gainR_out;

end architecture behavior;