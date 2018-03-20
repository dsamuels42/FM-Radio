library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use work.fm_package.all;

entity demod_tb is
generic
(
	constant OUT_NAME : string (1 to 19) := "test/demod_file.dat";
	constant IN_NAME1 : string (1 to 15) := "test/I_file.dat";
	constant IN_NAME2 : string (1 to 15) := "test/Q_file.dat";
	constant CLOCK_PERIOD : time := 10 ns
); end entity;


architecture behavior of demod_tb is
	--clock, reset, signals
		-- clock, reset signals
signal clock : std_logic := '1';
signal hold_clock : std_logic := '0';
signal reset : std_logic := '0';
signal start : std_logic;
signal demod_out: std_logic_vector (DATA_SIZE-1 downto 0);
signal I : std_logic_vector (DATA_SIZE-1 downto 0);
signal Q : std_logic_vector (DATA_SIZE-1 downto 0);
signal done : std_logic;

begin

test_component: component demod
port map (
	clock => clock,
	reset => reset,
	start => start,
	I => I,
	Q => Q,
	demod_out => demod_out,
	done => done
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
	file mem_in_file2 : raw_file open read_mode is IN_NAME2;
    variable char : character;
    variable din : std_logic_vector (7 downto 0);
begin
    wait until (reset = '1');
    wait until (reset = '0');

	
	
    for j in 0 to 99 loop
        read( mem_in_file1, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	I(7 downto 0) <= din;
	read( mem_in_file1, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	I(15 downto 8) <= din;
        read( mem_in_file2, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	Q(7 downto 0) <= din;
	read( mem_in_file2, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	Q(15 downto 8) <= din;
        start <= '1';
        wait until (done = '1');
    end loop;

    file_close( mem_in_file1);
	file_close( mem_in_file2);
    wait;
end process file_read_process; 


file_compare_process : process 
    type raw_file is file of character;
    file mem_out_file: raw_file open read_mode is OUT_NAME;
    variable errors : integer := 0;
    variable char : character;
    variable din : std_logic_vector (7 downto 0);
    variable demod_comp: std_logic_vector (15 downto 0);
    variable ln : line;
begin
    wait until (reset = '1');
    wait until (reset = '0');
    wait until (clock = '0');
    wait until (clock = '1');

    for j in 0 to 99 loop
	wait until (done = '1');
        read( mem_out_file, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	demod_comp (7 downto 0) := din;
	read( mem_out_file, char );
        din := std_logic_vector(to_unsigned( character'pos(char), 8 ));
	demod_comp (15 downto 8) := din;
	wait until(clock = '0');
	if (demod_out /= demod_comp) then
		errors := errors + 1;
	end if;
	wait until(clock = '1');
    end loop;

    write(ln, string'("total errors: "));
    write(ln, errors);
    writeline( output, ln );

    hold_clock <= '1';

    file_close( mem_out_file);
    wait;
end process file_compare_process;





end architecture;
