LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sr_latch IS
	PORT(
		S	:	IN STD_LOGIC;
		R	:	IN STD_LOGIC;
		Q	:  BUFFER STD_LOGIC;
		Qb	:  BUFFER STD_LOGIC
	);
END ENTITY;

ARCHITECTURE dataflow OF sr_latch IS
	
		BEGIN
			Q	<= S NOR Qb;
			Qb <= R NOR Q;

END ARCHITECTURE;