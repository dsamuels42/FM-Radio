
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

package fm_package is

constant DATA_SIZE: integer := 16;
constant BITS: integer := 10;
constant QUANT_VAL: integer := 2 ** BITS;
constant GAIN_C: std_logic_vector (DATA_SIZE-1 downto 0) := (0 => '1', OTHERS => '0');

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
