LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY circuit_A IS
	PORT(
			vin	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			aout	:  OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END circuit_A;
	
ARCHITECTURE behavioral OF circuit_A IS
BEGIN
		PROCESS(vin)
			BEGIN
				CASE vin IS
					WHEN "1010" => 
						aout <= "0000";
					WHEN "1011" =>
						aout <= "0001";
					WHEN "1100" =>
						aout <= "0010";
					WHEN "1101" =>
						aout <= "0011";
					WHEN "1110" =>
						aout <= "0100";
					WHEN "1111" =>
						aout <= "0101";
					WHEN OTHERS =>
						aout <= "0000";
				END CASE;
		END PROCESS;
END behavioral;	