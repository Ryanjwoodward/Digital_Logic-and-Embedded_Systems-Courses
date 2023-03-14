LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d_flipflop IS
	PORT(
		d : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		set : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		q : OUT STD_LOGIC := '0';
		qb : OUT STD_LOGIC := '1'
	);
END d_flipflop;

ARCHITECTURE d_flipflop_logic OF d_flipflop IS
		SIGNAL m : STD_LOGIC;
			BEGIN
				PROCESS(clk)
					BEGIN
						IF(rising_edge (clk)) THEN
							IF (set = '0') THEN
								m <= '0';
							ELSIF (reset = '0') THEN
								m <= '1';
							ELSE
								m <= d;
							END IF;	
						END IF;
				END PROCESS;
		q <= m;
		qb <= NOT m;
	END d_flipflop_logic;
	
