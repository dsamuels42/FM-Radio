library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.fm_package.all;

entity mult is
port
(
	signal clock : in std_logic;
	signal reset : in std_logic;
	signal A : in std_logic_vector (DATA_SIZE-1 downto 0);
	signal B : in std_logic_vector (DATA_SIZE-1 downto 0);
	signal res : out std_logic_vector (DATA_SIZE-1 downto 0)
);
end entity mult;

architecture behavior of mult is 
begin

regproc: process (clock, reset)
variable temp: std_logic_vector(2*DATA_SIZE-1 downto 0);
begin
	if (reset = '1') then
		res <= (OTHERS => '0');
	elsif (rising_edge(clock)) then
		temp := DEQUANTIZE(std_logic_vector(signed(A) * signed(B)));
		res <= temp(DATA_SIZE-1 downto 0);
	end if;
end process regproc;

end architecture behavior;