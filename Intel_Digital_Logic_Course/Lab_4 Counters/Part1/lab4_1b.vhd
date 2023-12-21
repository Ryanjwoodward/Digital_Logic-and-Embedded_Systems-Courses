LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY lab4 IS
	PORT(
			enable_sw		:	IN STD_LOGIC;
			clock_btn		:	IN STD_LOGIC;
			reset_sw			:	IN STD_LOGIC;
			q_leds			:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE Behavioral OF lab4 IS
	
	COMPONENT t_flipflop IS
		PORT(
			t_sw		:	IN STD_LOGIC;
			clk_btn	:  IN STD_LOGIC;
			rst_sw	:  IN STD_LOGIC;
			q_led		:  OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL q1, q2, q3, q4, q5, q6, q7, q8 : STD_LOGIC;
	BEGIN
	
		tff1 : t_flipflop PORT MAP(enable_sw, clock_btn, reset_sw, q1);
		q_leds(0) <= q1;
		
		tff2 : t_flipflop PORT MAP(enable_sw, q1, reset_sw, q2);
		q_leds(1) <= q2;
		
		tff3 : t_flipflop PORT MAP(enable_sw, q2, reset_sw, q3);
		q_leds(2) <= q3;
		
		tff4 : t_flipflop PORT MAP(enable_sw, q3, reset_sw, q4);
		q_leds(3) <= q4;
		
		tff5 : t_flipflop PORT MAP(enable_sw, q4, reset_sw, q5);
		q_leds(4) <= q5;
		
		tff6 : t_flipflop PORT MAP(enable_sw, q5, reset_sw, q6);
		q_leds(5) <= q6;
		
		tff7 : t_flipflop PORT MAP(enable_sw, q6, reset_sw, q7);
		q_leds(6) <= q7;
		
		tff8 : t_flipflop PORT MAP(enable_sw, q7, reset_sw, q8);
		q_leds(7) <= q8;
		
		
		
		
		
END ARCHITECTURE;