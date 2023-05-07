LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY lab1_part4 IS

	PORT(
			c : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			h : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
		
END lab1_part4;

ARCHITECTURE Behavioral OF lab1_part4 IS
BEGIN
		PROCESS(c)
			BEGIN
				CASE c IS
				
					WHEN "00" =>
						h <= not "1011110" ;
					WHEN "01" =>
						h <= not "1111001" ;
					WHEN "10" =>
						h <= not "0000110" ;
					WHEN "11" =>
						h <= not "0111111" ;	 
					WHEN OTHERS =>
						h <= not "1000000" ;
				
				END CASE;
		END PROCESS;
END Behavioral;

