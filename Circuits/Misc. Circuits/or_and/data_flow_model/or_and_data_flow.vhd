LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY or_and IS
	PORT(
		a : IN STD_LOGIC;
		b : IN STD_LOGIC;
		c : IN STD_LOGIC;
		e : OUT STD_LOGIC
	);
END or_and;

ARCHITECTURE or_and_behavioral OF or_and IS
	SIGNAL ABC: STD_LOGIC_VECTOR(2 downto);
	
	BEGIN
		ABC <= a & b & c;
			PROCESS(a, b, c,) IS
				BEGIN
					CASE(ABC) IS
						WHEN "011" => e <= '1';
						WHEN "101" => e <= '1';
						WHEN "111" => e <= '1';
						WHEN OTHERS => e <= '0';
					END CASE;
			END PROCESS;
END or_and_behavioral;			
						

