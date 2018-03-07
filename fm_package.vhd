
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

package fm_package is

constant DATA_SIZE: integer := 16;
constant BITS: integer := 10;
constant QUANT_VAL: integer := 2 ** BITS;
constant GAIN_C: std_logic_vector (DATA_SIZE-1 downto 0) := (0 => '1', OTHERS => '0');

type COEFF_ARR_T is array (natural range <>) of std_logic_vector(DATA_SIZE-1 downto 0);

constant CHANNEL_COEFF_TAPS : integer := 20;
constant CHANNEL_COEFFS_REAL : COEFF_ARR_T (0 to CHANNEL_COEFF_TAPS-1) :=
   (x"0001", x"0008", x"fff3", x"0009", x"000b", x"ffd3", x"0045", x"ffd3",
    x"ffb1", x"0257", x"0257", x"ffb1", x"ffd3", x"0045", x"ffd3", x"000b",
    x"0009", x"fff3", x"0008", x"0001");
constant CHANNEL_COEFFS_IMAG : COEFF_ARR_T (0 to CHANNEL_COEFF_TAPS-1) :=
   (x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
    x"0000", x"0000", x"0000", x"0000");

constant AUDIO_LPR_COEFF_TAPS : integer := 32;
constant AUDIO_LPR_COEFFS : COEFF_ARR_T (0 to AUDIO_LPR_COEFF_TAPS-1) :=
   (x"fffd", x"fffa", x"fff4", x"ffed", x"ffe5", x"ffdf", x"ffe2", x"fff3",
    x"0015", x"004e", x"009b", x"00f9", x"015d", x"01be", x"020e", x"0243",
    x"0243", x"020e", x"01be", x"015d", x"00f9", x"009b", x"004e", x"0015",
    x"fff3", x"ffe2", x"ffdf", x"ffe5", x"ffed", x"fff4", x"fffa", x"fffd");

constant AUDIO_LMR_COEFF_TAPS : integer := 32;
constant AUDIO_LMR_COEFFS : COEFF_ARR_T (0 to AUDIO_LMR_COEFF_TAPS-1) :=
   (x"fffd", x"fffa", x"fff4", x"ffed", x"ffe5", x"ffdf", x"ffe2", x"fff3",
    x"0015", x"004e", x"009b", x"00f9", x"015d", x"01be", x"020e", x"0243",
    x"0243", x"020e", x"01be", x"015d", x"00f9", x"009b", x"004e", x"0015",
    x"fff3", x"ffe2", x"ffdf", x"ffe5", x"ffed", x"fff4", x"fffa", x"fffd");

constant BP_PILOT_COEFF_TAPS : integer := 32;
constant BP_PILOT_COEFFS : COEFF_ARR_T (0 to BP_PILOT_COEFF_TAPS-1) :=
   (x"000e", x"001f", x"0034", x"0048", x"004e", x"0036", x"fff8", x"ff98",
    x"ff2d", x"feda", x"fec3", x"fefe", x"ff8a", x"004a", x"010f", x"01a1",
    x"01a1", x"010f", x"004a", x"ff8a", x"fefe", x"fec3", x"feda", x"ff2d",
    x"ff98", x"fff8", x"0036", x"004e", x"0048", x"0034", x"001f", x"000e");

constant BP_LMR_COEFF_TAPS : integer := 32;
constant BP_LMR_COEFFS : COEFF_ARR_T (0 to BP_LMR_COEFF_TAPS-1) :=
   (x"0000", x"0000", x"fffc", x"fff9", x"fffe", x"0008", x"000c", x"0002",
    x"0003", x"001e", x"0030", x"fffc", x"ff8c", x"ff58", x"ffc3", x"008a",
    x"008a", x"ffc3", x"ff58", x"ff8c", x"fffc", x"0030", x"001e", x"0003",
    x"0002", x"000c", x"0008", x"fffe", x"fff9", x"fffc", x"0000", x"0000");

constant HP_COEFF_TAPS : integer := 32;
constant HP_COEFFS : COEFF_ARR_T (0 to HP_COEFF_TAPS-1) :=
   (x"ffff", x"0000", x"0000", x"0002", x"0004", x"0008", x"000b", x"000c",
    x"0008", x"ffff", x"ffee", x"ffd7", x"ffbb", x"ff9f", x"ff87", x"ff76",
    x"ff76", x"ff87", x"ff9f", x"ffbb", x"ffd7", x"ffee", x"ffff", x"0008",
    x"000c", x"000b", x"0008", x"0004", x"0002", x"0000", x"0000", x"ffff");



function QUANTIZE_F (f : real) return std_logic_vector;
function QUANTIZE_I (i : std_logic_vector) return std_logic_vector;
function DEQUANTIZE (i : std_logic_vector) return std_logic_vector;

constant PI : real :=  3.1415926535897932384626433832795;
constant ADC_RATE : integer := 64000000;
constant USRP_DECIM : integer := 250; 
constant QUAD_RATE : integer := (ADC_RATE/USRP_DECIM); 
constant AUDIO_DECIM : integer := 8;
constant AUDIO_RATE : integer := (QUAD_RATE/AUDIO_DECIM);	
--constant VOLUME_LEVEL : std_logic_vector(DATA_SIZE-1 downto 0) := "0000000000000000";-- := QUANTIZE_F(1.0);--this cant be done in this file it has to be done outside of the package apparently
constant SAMPLES : integer := 65536*4;
constant AUDIO_SAMPLES : integer := (SAMPLES/AUDIO_DECIM);
constant MAX_TAPS : integer := 32;
constant MEX_DEV : real := 55000.0;
--constant FM_DEMOD_GAIN : std_logic_vector(DATA_SIZE-1 downto 0) :="0000000000000000"; --same as stated above
constant TAU : real := 0.000075;
constant W_PP : real := 0.21140067;

end package;

package body fm_package is

function QUANTIZE_F (f : real) return std_logic_vector is
begin
	return std_logic_vector(to_signed(integer(trunc(f * real(QUANT_VAL))), DATA_SIZE));
end QUANTIZE_F;

function QUANTIZE_I (i : std_logic_vector) return std_logic_vector is
begin
	return std_logic_vector(signed(i) * to_signed(QUANT_VAL, DATA_SIZE));
end QUANTIZE_I;

function DEQUANTIZE (i : std_logic_vector) return std_logic_vector is
begin
	return std_logic_vector(signed(i) / to_signed(QUANT_VAL, DATA_SIZE));
end DEQUANTIZE;

end fm_package;
