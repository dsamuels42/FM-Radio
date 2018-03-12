library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use work.fm_package.all;
entity de_emphasis is 
generic(


constant TAPS : integer;
constant DECIMATION : integer; 
constant X_COEFFS : integer;
constant N_SAMPLES : integer; 
constant Y_COEFFS : integer
);
port(
	
	signal clock : in std_logic;
	signal reset : in std_logic; 
	signal x_in : INTERMED_ARR;	
	signal x : in INTERMED_ARR;
	signal y : in INTERMED_ARR;

	signal y_out : out std_logic_vector(DATA_SIZE-1 downto 0)
);

end entity;


architecture behavioral of de_emphasis is 
--functions and signals

--type INTERMED_ARR is array (0 to TAPS-1) of std_logic_vector(DATA_SIZE-1 downto 0);
--signal in_x : INTERMED_ARR;
--signal x : INTERMED_ARR;
--signal y : INTERMED_ARR;


function iir(x_in : INTERMED_ARR; x :INTERMED_ARR; y:INTERMED_ARR )
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

	for  j in decimation-1 downto TAPS -1 loop
		x_t(j) := x_t(j - decimation);
	end loop;
	
	for i in 0 to decimation -1 loop
		x_t(decimation - i -1) := x_in_t(i);
	end loop;
	
	for j in (TAPS -1) downto 0 loop
		y_t(j) := y(j-1); 
	end loop;

	for i in 0 to TAPS-1 loop
		t1 := X_COEFFS * to_integer(signed(x(i)));
		t2 := Y_COEFFS * to_integer(signed(y(i)));

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
deemph:process(x,y,x_in)
variable i,j : integer :=0;
variable n_elements : integer := N_SAMPLES/DECIMATION;

begin

for i in 0 to n_elements loop
	j := j + DECIMATION;
	y_out <= iir(x_in,x,y);
end loop;


end process deemph;



end architecture behavioral; 