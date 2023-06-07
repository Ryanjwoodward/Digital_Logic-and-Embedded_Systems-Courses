LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY lab3_part3 IS

	PORT(
			d		:	IN	STD_LOGIC;
			clk	:	IN STD_LOGIC;
			q		: OUT STD_LOGIC;
			qb		: OUT STD_LOGIC
	);
END ENTITY;


ARCHITECTURE structural OF lab3_part3 IS

	COMPONENT d_latch IS
		PORT(
			D		:	IN STD_LOGIC;
			Clk	:  IN STD_LOGIC;
			Q		:	OUT STD_LOGIC;
			Qb		:	OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL qm : STD_LOGIC;
	SIGNAL qo : STD_LOGIC;
	
	BEGIN
			master	:	d_latch PORT MAP(d, NOT clk, qm, qo);
			slave		:  d_latch PORT MAP(qm, clk, q, qb);

END ARCHITECTURE;