LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY bcd_decoder_ext IS

	PORT(
			c : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
			h : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
		
END bcd_decoder_ext;

ARCHITECTURE Behavioral OF bcd_decoder_ext IS
BEGIN
		PROCESS(c)
			BEGIN
				CASE c IS
				
					WHEN "000" =>
						h <= NOT "0111101" ;--d
					WHEN "001" =>
						h <= NOT "1001111" ;--E
					WHEN "010" =>
						h <= NOT "0110000" ;--1
					WHEN "011" =>
						h <= NOT "1111110" ;--0 
					WHEN "100" =>
						h <= NOT "0000001" ;-- -
					WHEN "101" =>
						h <= NOT "0000001" ;-- -
					WHEN OTHERS =>
						h <= NOT "0000000" ;-- blank
				END CASE;
		END PROCESS;
END Behavioral;