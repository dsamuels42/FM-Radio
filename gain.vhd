library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.fm_package.all;

entity gain is
port
(
	signal clock : in std_logic;
	signal reset : in std_logic;
	signal A : in std_logic_vector (DATA_SIZE-1 downto 0);
	signal res : out std_logic_vector (DATA_SIZE-1 downto 0)
);
end entity gain;

architecture behavior of gain is 
begin

regproc: process (clock, reset)
variable temp: std_logic_vector(2*DATA_SIZE-1 downto 0);
constant GAIN_C: std_logic_vector(DATA_SIZE-1 downto 0) := QUANTIZE_F(1.0);
begin
	if (reset = '1') then
		res <= (OTHERS => '0');
	elsif (rising_edge(clock)) then
		temp := DEQUANTIZE(std_logic_vector(signed(A) * signed(GAIN_C)));
		res <= std_logic_vector(shift_left(signed(temp(DATA_SIZE-1 downto 0)), integer(14-BITS)));
	end if;
end process regproc;

end architecture behavior;
