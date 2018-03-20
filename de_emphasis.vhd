library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use work.fm_package.all;


entity de_emphasis is 
generic(


constant TAPS : integer := IIR_COEFF_TAPS; 
constant DECIMATION : integer := 1; 
constant X_COEFFS : coeffs := (QUANTIZE_F(0.0), QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0)))); 
constant Y_COEFFS : coeffs := (QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0))),QUANTIZE_F( ((W_PP - 1.0) / (W_PP +1.0)))); 
constant N_SAMPLES : integer := AUDIO_SAMPLES

);
port(
	
	signal clock : in std_logic;
	signal reset : in std_logic; 
	signal x_in : in std_logic_Vector(DATA_SIZE-1 downto 0) ;	
	signal y_out : out std_logic_vector(DATA_SIZE-1 downto 0)
);

end entity;


architecture behavioral of de_emphasis is 
--functions and signals






begin
-- the reset proces should go in the upper level 
iir_n:process(clock,reset)--this is really iir_n
variable i,j : integer :=0;
variable n_elements : integer := N_SAMPLES/DECIMATION;
variable y1,y2 : integer;
variable t1 : integer;
variable t2 : integer;
variable temp_1 : std_logic_Vector(DATA_SIZE-1 downto 0);
variable temp_2 : std_logic_Vector(DATA_SIZE-1 downto 0);
variable i_x : std_logic_vector(DATA_SIZE-1 downto 0) := (others =>'0');
variable i_y : std_logic_vector(DATA_SIZE-1 downto 0) := (others =>'0');
begin


if reset ='1' then
	
	y_out <= (others =>'0');
	i_x := (others =>'0');
	i_y := (others =>'0');

elsif(rising_edge(clock)) then
	-- gets x

	i_x := x_in; 
	-- gets y

	--gets new y
	
	for i in 0 to TAPS-1 loop
		t1 := to_integer(signed(X_COEFFS(i))) * to_integer(signed(i_x));
		t2 := to_integer(signed(Y_COEFFS(i))) * to_integer(signed(i_y));

		temp_1 := DEQUANTIZE(std_logic_Vector(to_signed(t1,DATA_SIZE)));
		temp_2 := DEQUANTIZE(std_logic_Vector(to_signed(t2,DATA_SIZE)));

		y1:= y1 + to_integer(signed(temp_1));
		y2:= y2 + to_integer(signed(temp_2));
	end loop;
		--update y
		i_y := std_logic_vector(to_signed(y1+y2,DATA_SIZE));
		--output results 
		y_out <= i_y;
end if;



end process iir_n;



end architecture behavioral; 
