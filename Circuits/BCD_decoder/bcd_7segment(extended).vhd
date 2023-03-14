LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY bcd_7segment IS
	PORT(
		bcd_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		seven_segment_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		seven_segment_out1	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END bcd_7segment ;

ARCHITECTURE Behavioral OF bcd_7segment IS
BEGIN
		PROCESS(bcd_in)
			BEGIN
				CASE bcd_in IS
					WHEN "0000" => -- x0
						seven_segment_out  <= not "0111111" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "0001" => --x1
						seven_segment_out <= not "0000110" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "0010" => --x2
						seven_segment_out <= not "1011011" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "0011" => --x3
						seven_segment_out <= not "1001111" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "0100" => --x4
						seven_segment_out <= not "1100110" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "0101" => --x5
						seven_segment_out <= not "1101101" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "0110" => --x6
						seven_segment_out <= not "1111101" 	;
						seven_segment_out1 <= not "0000000" ;
					WHEN "0111" => --x7
						seven_segment_out <= not "0000111" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "1000" => --x8
						seven_segment_out <= not "1111111" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "1001" => --x9
						seven_segment_out <= not "1100111" ; 
						seven_segment_out1 <= not "0000000" ;	
					WHEN "1010" => -- 10
						seven_segment_out  <= not "0111111" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "1011" => --11
						seven_segment_out <= not "0000110" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "1100" => --12
						seven_segment_out <= not "1011011" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "1101" => --13
						seven_segment_out <= not "1001111" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "1110" => --14
						seven_segment_out <= not "1100110" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "1111" => --15
						seven_segment_out <= not "1101101" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN OTHERS =>
						seven_segment_out <= not "1111111" ;
						seven_segment_out1<= not "1111111" ;
				END CASE;
		END PROCESS;
END Behavioral;