LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY bcd_7segment IS
	PORT(bcd_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	seven_segment_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0))
END bcd_7segment ;

ARCHITECTURE Behavioral OF bcd_7segment IS
BEGIN
		PROCESS(bcd_in)
			BEGIN
				CASE bcd_in IS
					WHEN "0000" =>
						seven_segment_out <= not "0111111" ;
					WHEN "0001" =>
						seven_segment_out <= not "0000110" 
					WHEN "0010" =>
						seven_segment_out <= not "1011011" 
					WHEN "0011" =>
						seven_segment_out <= not "1001111" 
					WHEN "0100" =>
						seven_segment_out <= not "1100110" 
					WHEN "0101" =>
						seven_segment_out <= not "1101101" 
					WHEN "0110" =>
						seven_segment_out <= not "1111101" 	
					WHEN "0111" =>
						seven_segment_out <= not "0000111" 
					WHEN "1000" =>
						seven_segment_out <= not "1111111" 
					WHEN "1001" =>
						seven_segment_out <= not "1100111"  	
					WHEN OTHERS =>
						seven_segment_out <= not "1111111" ;
				END CASE;
		END PROCESS;
END Behavioral;		