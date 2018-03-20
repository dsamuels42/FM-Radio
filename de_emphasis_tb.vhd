library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use work.fm_package.all;

entity de_emphasis_tb is
generic
(
	constant IN_NAME1 : string (1 to 18) := "test/left_file.dat";
	constant OUT_NAME1 : string (1 to 25) := "test/left_deemph_file.dat";
	constant CLOCK_PERIOD : time := 10 ns
); 
end entity;


architecture behavior of de_emphasis_tb is
	--clock, reset, signals
signal clock : std_logic := '1';
signal hold_clock : std_logic := '0';
signal reset : std_logic := '0';
signal x : std_logic_vector (DATA_SIZE-1 downto 0);
signal y : std_logic_vector (DATA_SIZE-1 downto 0);

begin

test_component: component de_emphasis
port map (
	clock => clock,
	reset => reset,
	x_in => x,
	y_out => y
);


clock_process : process
begin
	clock <= '1';
	wait for (CLOCK_PERIOD / 2);
	clock <= '0';
	wait for (CLOCK_PERIOD / 2);
	if ( hold_clock = '1' ) then
		wait;
	end if;
end process clock_process;

reset_process : process
begin
	reset <= '0';
	wait until (clock = '0');
	wait until (clock = '1');
	reset <= '1';
	wait until (clock = '0');
	wait until (clock = '1');
	reset <= '0';
	wait;
end process reset_process;


file_read_process : process 
    type raw_file is file of character;
    file mem_in_file1 : raw_file open read_mode is IN_NAME1;
    variable char : character;
    variable din : std_logic_vector (7 downto 0);
begin
    wait until (reset = '1');
    wait until (reset = '0');

    for j in 0 to 99 loop
        read( mem_in_file1, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	x_in(7 downto 0) <= din;
	read( mem_in_file1, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	x_in(15 downto 8) <= din;
	read( mem_in_file1, char );
	read( mem_in_file1, char );

        wait until (clock = '0');
        wait until (clock = '1');
    end loop;

    file_close( mem_in_file1 );
    wait;
end process file_read_process; 


file_compare_process : process 
    type raw_file is file of character;
    file mem_out_file1 : raw_file open read_mode is OUT_NAME1;
    variable errors : integer := 0;
    variable char : character;
    variable din : std_logic_vector (7 downto 0);
    variable valu : std_logic_vector (15 downto 0);
    variable ln : line;
begin
    wait until (reset = '1');
    wait until (reset = '0');
    wait until (clock = '0');
    wait until (clock = '1');
    wait until (clock = '0');
    wait until (clock = '1');

    for j in 0 to 99 loop
        read( mem_out_file1, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	valu (7 downto 0) := din;
	read( mem_out_file1, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	valu (15 downto 8) := din;
	read( mem_out_file1, char );
	read( mem_out_file1, char );

	wait until(clock = '0');
	if (y_out /= valu) then
		errors := errors + 1;
	end if;
	wait until(clock = '1');
    end loop;

    write(ln, string'("total errors: "));
    write(ln, errors);
    writeline( output, ln );

    hold_clock <= '1';

    file_close( mem_out_file1 );
    wait;
end process file_compare_process;





end architecture;
