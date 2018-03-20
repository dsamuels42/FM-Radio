Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use work.fm_package.all;

entity fir is
generic
(
	constant TAPS : integer;
	constant DECIMATION : integer;
	constant COEFF : COEFF_ARR_T
);
port
(
	signal clock : in std_logic;
	signal reset : in std_logic;
	signal x : in std_logic_vector(DATA_SIZE-1 downto 0);
	signal y : out std_logic_vector(DATA_SIZE-1 downto 0);
	signal valid : out std_logic
);
end entity fir;

architecture behavior of fir is 
type INTERMED_ARR_T is array (0 to TAPS-1) of std_logic_vector(DATA_SIZE-1 downto 0);
signal intermed : INTERMED_ARR_T;
constant VALID_BITS : integer := integer(ceil(log2(real(DECIMATION))));
signal valid_count : std_logic_vector(VALID_BITS-1 downto 0);
signal y_r : std_logic_vector(2*DATA_SIZE-1 downto 0);

begin

filter_proc: process (x)
begin

end process;

reg_proc: process (clock, reset)
begin
	if (reset = '1') then
		y <= (OTHERS => '0');
		valid_count <= "000";
		valid <= '0';
		for i in 0 to TAPS-1 loop
			intermed(i) <= (OTHERS => '0');
		end loop;
	elsif (rising_edge(clock)) then
		for i in 0 to TAPS-1 loop
			y_r <= std_logic_vector(signed(y_r) + signed(DEQUANTIZE(std_logic_vector(signed(intermed(i)) * signed(COEFF(TAPS-i-1))))));
		end loop;
		y <= y_r(DATA_SIZE-1 downto 0);

		for i in TAPS-1 to 1 loop
			intermed(i) <= intermed(i - 1);
		end loop;
		intermed(0) <= x;

		valid_count <= std_logic_vector(unsigned(valid_count) + to_unsigned(1, VALID_BITS));
		if (DECIMATION = 1) then
			valid <= '1';
		elsif (valid_count = std_logic_vector(to_unsigned(2**VALID_BITS - 1, VALID_BITS))) then
			valid <= '1';
		else
			valid <= '0';
		end if;
	end if;
end process;

end behavior;
