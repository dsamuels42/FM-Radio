library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.fm_package.all;

entity read_iq is
port
(
	signal clock : in std_logic;
	signal reset : in std_logic;
	signal IQ : in std_logic_vector (2*DATA_SIZE-1 downto 0);
	signal I : out std_logic_vector (DATA_SIZE-1 downto 0);
	signal Q : out std_logic_vector (DATA_SIZE-1 downto 0)
);
end entity read_iq;

architecture behavior of read_iq is
begin

regproc: process (clock, reset)
begin
	if (reset = '1') then
		I <= (OTHERS => '0');
		Q <= (OTHERS => '0');
	elsif (rising_edge(clock)) then
		I <= QUANTIZE_I(IQ(DATA_SIZE-1 downto 0));
		Q <= QUANTIZE_I(IQ(2*DATA_SIZE-1 downto DATA_SIZE));
	end if;
end process regproc;

end architecture behavior;
