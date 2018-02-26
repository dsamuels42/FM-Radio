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