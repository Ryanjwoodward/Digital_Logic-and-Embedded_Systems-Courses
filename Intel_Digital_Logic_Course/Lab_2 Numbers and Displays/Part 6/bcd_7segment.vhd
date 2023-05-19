LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY bcd_7segment IS
	PORT(
		bcd_in : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		seven_segment_out 	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		seven_segment_out1	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END bcd_7segment ;

ARCHITECTURE Behavioral OF bcd_7segment IS
BEGIN
		PROCESS(bcd_in)
			BEGIN
				CASE bcd_in IS
					WHEN "000000" => -- x0
						seven_segment_out  <= not "0111111" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "000001" => --x1
						seven_segment_out <= not "0000110" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "000010" => --x2
						seven_segment_out <= not "1011011" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "000011" => --x3
						seven_segment_out <= not "1001111" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "000100" => --x4
						seven_segment_out <= not "1100110" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "000101" => --x5
						seven_segment_out <= not "1101101" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "000110" => --x6
						seven_segment_out <= not "1111101" 	;
						seven_segment_out1 <= not "0000000" ;
					WHEN "000111" => --x7
						seven_segment_out <= not "0000111" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "001000" => --x8
						seven_segment_out <= not "1111111" ;
						seven_segment_out1 <= not "0000000" ;
					WHEN "001001" => --x9
						seven_segment_out <= not "1100111" ; 
						seven_segment_out1 <= not "0000000" ;	
					WHEN "001010" => -- 10
						seven_segment_out  <= not "0111111" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "001011" => --11
						seven_segment_out <= not "0000110" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "001100" => --12
						seven_segment_out <= not "1011011" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "001101" => --13
						seven_segment_out <= not "1001111" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "001110" => --14
						seven_segment_out <= not "1100110" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "001111" => --15
						seven_segment_out <= not "1101101" ;
						seven_segment_out1 <= not "0000110" ;
					WHEN "010000" => -- 16	
						seven_segment_out <= not "1111101";
						seven_segment_out1 <= not "0000110" ;
					WHEN "010001" => -- 17
						seven_segment_out <= not "0000111";
						seven_segment_out1 <= not "0000110" ;
					WHEN "010010" => -- 18
						seven_segment_out <= not "1111111";
						seven_segment_out1 <= not "0000110" ;
					WHEN "010011" => -- 19
						seven_segment_out <= not "1100111";
						seven_segment_out1 <= not "0000110" ;
						
						
					WHEN "010100" => -- 20
						seven_segment_out <= not "0111111";
						seven_segment_out1 <= not "1011011" ;
					WHEN "010101" => -- 21
						seven_segment_out <= not "0000110";
						seven_segment_out1 <= not "1011011" ;
					WHEN "010110" => -- 22
						seven_segment_out <= not "1011011";
						seven_segment_out1 <= not "1011011" ;
					WHEN "010111" => -- 23
						seven_segment_out <= not "1001111";
						seven_segment_out1 <= not "1011011" ;
					WHEN "011000" => -- 24
						seven_segment_out <= not "1100110";
						seven_segment_out1 <= not "1011011" ;
					WHEN "011001" => -- 25
						seven_segment_out <= not "1101101";
						seven_segment_out1 <= not "1011011" ;
					WHEN "011010" => -- 26
						seven_segment_out <= not "1111101";
						seven_segment_out1 <= not "1011011" ;
					WHEN "011011" => -- 27
						seven_segment_out <= not "0000111";
						seven_segment_out1 <= not "1011011" ;
					WHEN "011100" => -- 28
						seven_segment_out <= not "1111111";
						seven_segment_out1 <= not "1011011" ;
					WHEN "011101" => -- 29
						seven_segment_out <= not "1100111";
						seven_segment_out1 <= not "1011011" ;
					WHEN "011110" => -- 30
						seven_segment_out <= not "0111111";
						seven_segment_out1 <= not "1001111" ;
					WHEN "011111" => -- 31
						seven_segment_out <= not "0000110";
						seven_segment_out1 <= not "1001111" ;
					WHEN "100000" => -- 32
						seven_segment_out <= not "1011011";
						seven_segment_out1 <= not "1001111";
					WHEN "100001" => -- 33
						seven_segment_out <= not "1001111";
						seven_segment_out1 <= not "1001111";
					WHEN "100010" => -- 34
						seven_segment_out <= not "1100110";
						seven_segment_out1 <= not "1001111";
					WHEN "100011" => -- 35
						seven_segment_out <= not "1101101";
						seven_segment_out1 <= not "1001111";
					WHEN "100100" => -- 36
						seven_segment_out <= not "1111101";
						seven_segment_out1 <= not "1001111";
					WHEN "100101" => -- 37
						seven_segment_out <= not "0000111";
						seven_segment_out1 <= not "1001111";
					WHEN "100110" => -- 38
						seven_segment_out <= not "1111111";
						seven_segment_out1 <= not "1001111";
					WHEN "100111" => -- 39
						seven_segment_out <= not "1100111";
						seven_segment_out1 <= not "1001111";
					WHEN "101000" => -- 40
						seven_segment_out <= not "0111111";
						seven_segment_out1 <= not "1100110";
					WHEN "101001" => -- 41
						seven_segment_out <= not "0000110";
						seven_segment_out1 <= not "1100110";
					WHEN "101010" => -- 42
						seven_segment_out <= not "1011011";
						seven_segment_out1 <= not "1100110";
					WHEN "101011" => -- 43
						seven_segment_out <= not "1001111";
						seven_segment_out1 <= not "1100110";
					WHEN "101100" => -- 44
						seven_segment_out <= not "1100110";
						seven_segment_out1 <= not "1100110";
					WHEN "101101" => -- 45
						seven_segment_out <= not "1101101";
						seven_segment_out1 <= not "1100110";
					WHEN "101110" => -- 46
						seven_segment_out <= not "1111101";
						seven_segment_out1 <= not "1100110";
					WHEN "101111" => -- 47
						seven_segment_out <= not "0000111";
						seven_segment_out1 <= not "1100110";
					WHEN "110000" => -- 48
						seven_segment_out <= not "1111111";
						seven_segment_out1 <= not "1100110";
					WHEN "110001" => -- 49
						seven_segment_out <= not "1100111";
						seven_segment_out1 <= not "1100110";
					WHEN "110010" => -- 50
						seven_segment_out <= not "0111111";
						seven_segment_out1 <= not "1101101";
					WHEN "110011" => -- 51
						seven_segment_out <= not "0000110";
						seven_segment_out1 <= not "1101101";
					WHEN "110100" => -- 52
						seven_segment_out <= not "1011011";
						seven_segment_out1 <= not "1101101";
					WHEN "110101" => -- 53
						seven_segment_out <= not "1001111";
						seven_segment_out1 <= not "1101101";
					WHEN "110110" => -- 54
						seven_segment_out <= not "1100110";
						seven_segment_out1 <= not "1101101";
					WHEN "110111" => -- 55
						seven_segment_out <= not "1101101";
						seven_segment_out1 <= not "1101101";
					WHEN "111000" => -- 56
						seven_segment_out <= not "1111101";
						seven_segment_out1 <= not "1101101";
					WHEN "111001" => -- 57
						seven_segment_out <= not "0000111";
						seven_segment_out1 <= not "1101101";
					WHEN "111010" => -- 58
						seven_segment_out <= not "1111111";
						seven_segment_out1 <= not "1101101";
					WHEN "111011" => -- 59
						seven_segment_out <= not "1100111";
						seven_segment_out1 <= not "1101101";
					WHEN "111100" => -- 60
						seven_segment_out <= not "0111111";
						seven_segment_out1 <= not "1111101";
					WHEN "111101" => -- 61
						seven_segment_out <= not "0000110";
						seven_segment_out1 <= not "1111101";
					WHEN "111110" => -- 62
						seven_segment_out <= not "1011011";
						seven_segment_out1 <= not "1111101";
					WHEN "111111" => -- 63
						seven_segment_out <= not "1001111";
						seven_segment_out1 <= not "1111101";

					WHEN OTHERS =>
						seven_segment_out <= not "1000000" ;
						seven_segment_out1<= not "1000000" ;
				END CASE;
		END PROCESS;
END Behavioral;

