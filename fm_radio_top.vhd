library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fm_radio_top is
generic(
	constant DATA_SIZE : integer := 16;
	constant BITS : integer := 10
);
port
(
	signal clock : in std_logic;
	signal reset : in std_logic

);
end entity fm_radio_top;

architecture behavior of fm_radio_top is

begin

end architecture behavior;
