LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY palu_bool_logic_unit IS
	PORT(
		a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		f : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
	
END palu_bool_logic_unit;

ARCHITECTURE behavioral OF palu_bool_logic_unit IS

BEGIN
			PROCESS(a, b)
				BEGIN
					IF (a = "1111" AND b = "1111") THEN
						f <= "1111";
					ELSE	
						f <= "0000";
					END IF;	
		
			END PROCESS;
END behavioral;		