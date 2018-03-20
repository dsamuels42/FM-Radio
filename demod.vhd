

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use work.fm_package.all;
use work.calc_const.all;

entity demod is 
generic
(
constant gain : integer := 10
);
port
(
 signal clock : in std_logic;
 signal reset : in std_logic;
 signal start : in std_logic;
 signal I : in std_logic_vector(DATA_SIZE - 1 downto 0);
 signal Q : in std_logic_vector(DATA_SIZE - 1 downto 0);
 signal demod_out : out std_logic_vector(DATA_SIZE - 1 downto 0);
 signal done : out std_logic
);
end entity;

architecture behavior of demod is 
	
component divider is
	port(
	--Inputs
	clock : in std_logic;
	--COMMENT OUT clk signal for Part A.
	start : in std_logic;
	dividend : in std_logic_vector (DIVIDEND_WIDTH - 1 downto 0);
	divisor : in std_logic_vector (DIVISOR_WIDTH - 1 downto 0);
	--Outputs
	quotient : out std_logic_vector (DIVIDEND_WIDTH - 1 downto 0);
	remainder : out std_logic_vector (DIVISOR_WIDTH - 1 downto 0);
	overflow, done : out std_logic
	);
end component divider;
	


TYPE state_type is (WAIT_FOR_START,A,B,C,D, E);	
signal state, next_state : state_type;
signal abs_y : integer;
signal angle, angle_c : std_logic_vector(DATA_SIZE-1 downto 0);
signal x, y, x_c, y_c, r_c, r : std_logic_vector(DATA_SIZE-1 downto 0);
signal dividend, dividend_c, quotient : std_logic_vector(2*DATA_SIZE-1 downto 0);
signal divisor, divisor_c, remainder : std_logic_vector(DATA_SIZE-1 downto 0);
signal divider_start, divider_start_c : std_logic;
signal divider_done, overflow : std_logic;
signal prev_I, prev_I_c: std_logic_vector(DATA_SIZE -1 downto 0);
signal prev_Q, prev_Q_c : std_logic_vector(DATA_SIZE -1 downto 0);
signal demod_out_c : std_logic_vector (DATA_SIZE-1 downto 0);

begin

divider_0 : divider port map(clock,divider_start, dividend, divisor, quotient, remainder, overflow, divider_done);
	
demod_process : process(clock,reset, I,Q, prev_I, prev_Q, state, next_state, dividend_c, 
	divisor_c, dividend, divisor, y, x, start, abs_y, divider_done, quotient, angle_c,
	angle, divider_start)
	variable r_t, i_t, i_t1, r_t1, angle_t1 : std_logic_vector(DATA_SIZE-1 downto 0);
	variable r, angle_t : std_logic_vector (2*DATA_SIZE-1 downto 0);
	variable q1 : std_logic_vector(DATA_SIZE-1 downto 0) := QUANTIZE_F(PI/4.0);
	variable q3 : std_logic_vector(DATA_SIZE-1 downto 0) := QUANTIZE_F(3.0*PI/4.0);
	---variable first : std_logic := '1';
begin
--dividend_c <= dividend;
--divisor_c <= divisor;
--next_state <= state;
--prev_I_c <= prev_I;
--prev_Q_c <= prev_Q;
--_c <= y;
--x_c <= x;
done <= '0';
abs_y <= 0;
divider_start <= '0';
--r := (OTHERS => '0');
--r_c <= r(DATA_SIZE-1 downto 0);
--demod_out_c <= (OTHERS => '0');
--angle_c <= angle;

divider_start_c <= divider_start;


case(state) is
	--a / b
	when WAIT_FOR_START =>
		if(start = '1') then
			next_state <= A;
			done <= '0';
			angle_t1 := (OTHERS => '0');
			--if(first = '1') then
				prev_I_c <= x"0000";
				prev_Q_c <= x"0000";
				--x_c <= (OTHERS => '0');
			--	y_c <= (OTHERS => '0');
				dividend_c <= (OTHErs => '0');
				divisor_c <= (OTHErs => '0');
				--demod_out <= (OTHERS => '0');
		--	end if;
		end if;
	
	when A =>
	done <= '0';
	angle_t1 := (OTHERS => '0');
	r_t := std_logic_vector(resize(signed(prev_I)*signed(I), DATA_SIZE));
	i_t := std_logic_vector(resize(signed(prev_I)*signed(Q), DATA_SIZE));
	r_t1 := std_logic_vector(resize(-1*signed(prev_Q)*signed(Q), DATA_SIZE));
	i_t1 := std_logic_vector(resize(-1*signed(prev_Q)*signed(I), DATA_SIZE));

	x_c <= DEQUANTIZE(r_t)- DEQUANTIZE(r_t1);    
	y_c <= DEQUANTIZE(i_t) + DEQUANTIZE(i_t1); 
	abs_y <= to_integer(abs(signed(y))) + 1;
	r_c <= (OTHERS => '0');
	if (signed(x) >= 0) then
		dividend_c <= QUANTIZE_I(x - abs_y);
		divisor_c <= x + abs_y;
	else
		dividend_c <= QUANTIZE_I(x + abs_y);
		divisor_c  <= abs_y - x;
	end if;	
	next_state <= B;
	divider_start <= '1';
	--demod_out <= (OTHERS => '0');
	
	
	
	when B =>
	abs_y <= to_integer(abs(signed(y))) + 1;
	done <= '0';
	angle_t1 := (OTHERS => '0');
	divider_start <= '0';
	if(divider_done = '1') then
		r := quotient;
		divider_start <= '0';
		next_state <= C;
	else 
		next_state <= B;
	end if;
	--demod_out <= (OTHERS => '0');
	
	
	
	
	
	when C =>
	abs_y <= to_integer(abs(signed(y))) + 1;
	done <= '0';
	divider_start <= '0';
		if(X > 0) then	
		    angle_t := q1 - DEQUANTIZE(q1*r)(2*DATA_SIZE-1 downto 0);
			angle_t1  := angle_t(DATA_SIZE-1 downto 0);
		else 
			angle_t := q3 - DEQUANTIZE(q1*r)(2*DATA_SIZE-1 downto 0);
			angle_t1  := angle_t(DATA_SIZE-1 downto 0);
		end if;
		--next_state <= D;
		--demod_out <= (OTHERS => '0');
		
		
		
		
	--when D=>
	--abs_y <= to_integer(abs(signed(y))) + 1;
	--divider_start <= '0';
		if(y <0) then
			angle_c <= X"0000"-angle_t1+X"0001";
		else 
		angle_c <= angle_t1;
		end if;
		next_state <= E;
		done <= '1';
		prev_I_c <= I;
		prev_Q_c <= Q;
		--demod_out <= (OTHERS => '0');
		
		
		
	when E=>
	abs_y <= to_integer(abs(signed(y))) + 1;
	done <= '0';
		divider_start <= '0';
		
		demod_out_c <= DEQUANTIZE(std_logic_vector(signed(angle)*10))(DATA_SIZE-1 downto 0);
		next_state <= WAIT_FOR_START;
	
	when others =>
	next_state <= WAIT_FOR_START;
	--x_c <= (OTHERS => '0');
	--y_c <= (OTHERS => '0');
	--dividend_c <= (OTHErs => '0');
	--divisor_c <= (OTHErs => '0');
	done <= '0';
	end case;



end process;



clock_process : process(reset, clock, I, Q, prev_Q, prev_I)
begin
		if (reset = '1') then
		prev_Q <= (Others => '0');
		prev_I <= (Others => '0');
		dividend <= (OTHERS => '0');
		divisor <= (OTHERS => '0');
	    angle <= (OTHERS => '0');
		demod_out  <= (Others => '0');
		x <= (OTHers => '0');
		y <= (OTHers => '0');
		state <= WAIT_FOR_START;
		r <= (OTHERS => '0');
		
		elsif(rising_edge(clock)) then
		  state <= next_state;
		  dividend <= dividend_c;
		  divisor <= divisor_c;
		  x <= x_c;
		  y <= y_c;
		  prev_Q <= prev_Q_c;
		  prev_I <= prev_I_c;
		  demod_out <= demod_out_c;
	     angle <= angle_c;
		 r <= r_c;
		 end if;

end process;


end architecture;