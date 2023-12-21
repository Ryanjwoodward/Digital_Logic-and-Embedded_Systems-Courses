LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY t_flipflop IS
	PORT(
		t_sw		:	IN STD_LOGIC;
		clk_btn	:  IN STD_LOGIC;
		rst_sw	:  IN STD_LOGIC;
		q_led		:  OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE Behavioral OF t_flipflop IS
	SIGNAL tmp : STD_LOGIC;
BEGIN
	PROCESS (clk_btn, t_sw, rst_sw)
	BEGIN
		IF	rst_sw = '1' THEN
			tmp <= '0';
		ELSIF FALLING_EDGE(clk_btn) THEN
			IF t_sw = '0' THEN
				tmp <= tmp;
			ELSIF t_sw = '1' THEN
				tmp <= NOT tmp;
			END IF;
		END IF;
	END PROCESS;
	q_led <= tmp;
END ARCHITECTURE;