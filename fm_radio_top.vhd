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
	
-- part 1 
-- input -> READ IQ -> FIR Cmlx -> demod -> fifo 1

--part 2 - left preprocessing
-- fifo 1 -> fir -> multB (must wait for othe path) -> fir -> fifo 2
-- fifo 1 -> fir -> multA -> fir -> multB

--part 3 -- right preprocessing
	--fifo 1 -> fir -> fifo 3
	
--part 4 , wait for fifo2 and fifo 3 to be ready

	
	
	
	
	

end architecture behavior;
