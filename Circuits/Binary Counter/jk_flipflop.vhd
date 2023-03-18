LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY jk_flipflop IS
	PORT(
		j : IN STD_LOGIC;
		k : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		set : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		q : OUT STD_LOGIC := '0';
		qb : OUT STD_LOGIC := '1'
	);
END jk_flipflop;

ARCHITECTURE jk_flipflop_logic OF jk_flipflop IS 
	SIGNAL m : STD_LOGIC;
	
		BEGIN
			PROCESS(clk)
				BEGIN
					IF(rising_edge (clk)) THEN
						IF(set = '1') THEN
							m <= '1';
						ELSIF (reset = '1') THEN
							m <= '0';
						ELSIF (j = '0' AND k = '1') THEN
							m <= '0';
						ELSIF (j = '1' AND k = '0') THEN
							m <= '1';
						ELSIF (j = '1' AND k = '1') THEN
							m <= NOT m;
						END IF;
					END IF;
				END PROCESS;
			q <= m;
			qb <= NOT m;
END jk_flipflop_logic;