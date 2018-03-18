Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.fm_package.all;

entity fir_complex is
generic
(
	constant TAPS : integer;
	constant REAL_COEFF : COEFF_ARR_T;
	constant IMAG_COEFF : COEFF_ARR_T
);
port
(
	signal clock : in std_logic;
	signal reset : in std_logic;
	signal x_real : in std_logic_vector(DATA_SIZE-1 downto 0);
	signal x_imag : in std_logic_vector(DATA_SIZE-1 downto 0);
	signal y_real : out std_logic_vector(DATA_SIZE-1 downto 0);
	signal y_imag : out std_logic_vector(DATA_SIZE-1 downto 0)
);
end entity fir_complex;

architecture behavior of fir_complex is 
type INTERMED_ARR_T is array (0 to TAPS-1) of std_logic_vector(DATA_SIZE-1 downto 0);
signal intermed_real : INTERMED_ARR_T;
signal intermed_imag : INTERMED_ARR_T;
--signal y_r_r : std_logic_vector(DATA_SIZE-1 downto 0);
--signal y_i_r : std_logic_vector(DATA_SIZE-1 downto 0);

begin

reg_proc: process (clock, reset)
variable mult_temp1 : std_logic_vector(2*DATA_SIZE-1 downto 0) := (OTHERS => '0');
variable mult_temp2 : std_logic_vector(2*DATA_SIZE-1 downto 0) := (OTHERS => '0');
variable deq_temp1 : std_logic_vector(2*DATA_SIZE-1 downto 0) := (OTHERS => '0');
variable deq_temp2 : std_logic_vector(2*DATA_SIZE-1 downto 0) := (OTHERS => '0');
variable temp1 : std_logic_vector(2*DATA_SIZE-1 downto 0) := (OTHERS => '0');
variable temp2 : std_logic_vector(2*DATA_SIZE-1 downto 0) := (OTHERS => '0');
begin
	if (reset = '1') then
		y_real <= (OTHERS => '0');
		y_imag <= (OTHERS => '0');
		for i in 0 to TAPS-1 loop
			intermed_real(i) <= (OTHERS => '0');
			intermed_imag(i) <= (OTHERS => '0');
		end loop;
	elsif (rising_edge(clock)) then
		temp1 := (OTHERS => '0');
		temp2 := (OTHERS => '0');
		for i in 0 to TAPS-1 loop
			mult_temp1 := std_logic_vector(signed(intermed_real(i)) * signed(REAL_COEFF(i)));
			deq_temp1 := DEQUANTIZE(mult_temp1);
			temp1 := std_logic_vector(signed(temp1) + signed(deq_temp1));

			mult_temp2 := std_logic_vector(signed(intermed_imag(i)) * signed(REAL_COEFF(i)));
			deq_temp2 := DEQUANTIZE(mult_temp2);
			temp2 := std_logic_vector(signed(temp2) + signed(deq_temp2));
		end loop;
		y_real <= temp1(15 downto 0);
		y_imag <= temp2(15 downto 0);

		for i in TAPS-1 downto 1 loop
			intermed_real(i) <= intermed_real(i - 1);
			intermed_imag(i) <= intermed_imag(i - 1);
		end loop;
		intermed_real(0) <= x_real;
		intermed_imag(0) <= x_imag;

	end if;
end process;

end behavior;
