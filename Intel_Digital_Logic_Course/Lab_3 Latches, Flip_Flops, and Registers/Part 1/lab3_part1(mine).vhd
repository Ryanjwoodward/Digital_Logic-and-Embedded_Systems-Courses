LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY lab3_part1 IS
	PORT (
		S	:	IN STD_LOGIC;
		R	:	IN STD_LOGIC;
		Clk:  IN STD_LOGIC;
		Q	:	OUT STD_LOGIC;
		Qb	:  OUT STD_LOGIC
	);
END lab3_part1;

ARCHITECTURE behavioral OF lab3_part1 IS
BEGIN
	PROCESS (Clk)
		VARIABLE mem: STD_LOGIC;
	BEGIN
		IF (Clk = '1' AND Clk'EVENT) THEN
			IF (S = '0' AND R = '0') THEN
				mem := mem;
			ELSIF (S = '1' AND R = '1') THEN
				mem := 'Z';
			ELSIF (S = '0' AND R = '1') THEN
				mem := '0';
			ELSE
				mem := '1';
			END IF;
		END IF;
		Q <= mem;
		Qb <= not mem;
	END PROCESS;
END behavioral;
