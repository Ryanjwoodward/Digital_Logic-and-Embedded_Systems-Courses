LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY bcd_decoder IS

	PORT(
			c : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			h : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
		
END bcd_decoder;

ARCHITECTURE Behavioral OF bcd_decoder IS
BEGIN
		PROCESS(c)
			BEGIN
				CASE c IS
				
					WHEN "00" =>
						h <= not "0111101" ;
					WHEN "01" =>
						h <= not "1001111" ;
					WHEN "10" =>
						h <= not "0110000" ;
					WHEN "11" =>
						h <= not "1111110" ;	 
				
				END CASE;
		END PROCESS;
END Behavioral;