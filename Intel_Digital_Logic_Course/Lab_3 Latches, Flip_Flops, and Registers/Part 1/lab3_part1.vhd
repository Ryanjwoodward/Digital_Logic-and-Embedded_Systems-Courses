LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY lab3_part1 IS
	PORT(
		s	:	IN STD_LOGIC;
		r	:	IN STD_LOGIC;
		e	:	IN STD_LOGIC;
		q	:  BUFFER STD_LOGIC;
		qb	:  BUFFER STD_LOGIC
	);
END ENTITY;

ARCHITECTURE dataflow OF lab3_part1 IS

		COMPONENT sr_latch IS
			PORT(
					S	:	IN STD_LOGIC;
					R	:	IN STD_LOGIC;
					Q	:  BUFFER STD_LOGIC;
					Qb	:  BUFFER STD_LOGIC
			);
		END COMPONENT;
	
		BEGIN
		
			srLatch0	: sr_latch PORT MAP(
														(s AND e),
														(r AND e),
														q,
														qb
												);

END ARCHITECTURE;