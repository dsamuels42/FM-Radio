library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.fm_package.all;

entity add_sub is
port
(
	signal clock : in std_logic;
	signal reset : in std_logic;
	signal sub : in std_logic;
	signal A : in std_logic_vector (DATA_SIZE-1 downto 0);
	signal B : in std_logic_vector (DATA_SIZE-1 downto 0);
	signal res : out std_logic_vector (DATA_SIZE-1 downto 0)
);
end entity add_sub;

architecture behavior of add_sub is
begin

regproc: process (clock, reset)
begin
	if (reset = '1') then
		res <= (OTHERS => '0');
	elsif (rising_edge(clock)) then
		if (sub = '0') then
			res <= std_logic_vector(signed(A) + signed(B));
		elsif (sub = '1') then
			res <= std_logic_vector(signed(A) - signed(B));
		else
			res <= (OTHERS => 'X');
		end if;
	end if;
end process regproc;

end architecture behavior;