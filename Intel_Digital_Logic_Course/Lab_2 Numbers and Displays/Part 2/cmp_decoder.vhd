LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY cmp_decoder IS
	PORT(
		z_in : IN STD_LOGIC;
		seven_seg_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END cmp_decoder ;

ARCHITECTURE Behavioral OF cmp_decoder IS
BEGIN
		PROCESS(z_in)
			BEGIN
				CASE z_in IS
					WHEN '0' => -- x0
						seven_seg_out  <= not "0111111" ;

					WHEN OTHERS => --1
						seven_seg_out  <= not "0000110" ;
				END CASE;
		END PROCESS;
END Behavioral;