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
	signal y_out : out std_logic_Vector(DATA_SIZE-1 downto 0) 
);

end entity;


architecture behavioral of de_emphasis is 
--functions and signals




function iir(x_in : INTERMED_ARR;x : INTERMED_ARR;y : INTERMED_ARR )
	return std_logic_vector is 
	variable y_out_t : std_logic_Vector(DATA_SIZE-1 downto 0) ; 
	variable y_t: INTERMED_ARR := y;
	variable i,j,y1,y2 :integer := 0; 
	variable x_in_t: INTERMED_ARR := x_in;
	variable x_t: INTERMED_ARR := x;
	variable t1 : integer;
	variable t2 : integer;
	variable temp_1 : std_logic_Vector(DATA_SIZE-1 downto 0);
	variable temp_2 : std_logic_Vector(DATA_SIZE-1 downto 0);
	--variable n_elements : integer : = 
	begin

	for  j in TAPS-1 downto DECIMATION -1 loop
		x_t(j) := x_t(j - decimation);
	end loop;
	
	for i in 0 to decimation  loop
		x_t(decimation - i -1) := x_in_t(i);
	end loop;
	
	for j in (TAPS -1) downto 0 loop
		y_t(j) := y_t(j-1); 
	end loop;

	for i in 0 to TAPS-1 loop
		t1 := to_integer(signed(X_COEFFS(i))) * to_integer(signed(x_t(i)));
		t2 := to_integer(signed(Y_COEFFS(i))) * to_integer(signed(y_t(i)));

		temp_1 := DEQUANTIZE(std_logic_Vector(to_signed(t1,DATA_SIZE)));
		temp_2 := DEQUANTIZE(std_logic_Vector(to_signed(t2,DATA_SIZE)));

		y1:= y1 + to_integer(signed(temp_1));
		y2:= y2 + to_integer(signed(temp_2));
	end loop;
		y_t(0) := std_logic_vector(to_signed(y1+y2,DATA_SIZE));
	        y_out_t := y_t(TAPS -1); 
		return y_out_t;
end function iir; 


begin
-- the reset proces should go in the upper level file.
iir_n:process(x_in)--this is really iir_n
variable i,j : integer :=0;
variable n_elements : integer := N_SAMPLES/DECIMATION;

begin

for i in 0 to n_elements loop
	j := j + DECIMATION;
	y_out(i) <= iir(x_in,x,y);--work on this-- it needs to be x_in(j ) but thats not working right now. also needs to add a reset process
end loop;


end process iir_n;



end architecture behavioral; 
