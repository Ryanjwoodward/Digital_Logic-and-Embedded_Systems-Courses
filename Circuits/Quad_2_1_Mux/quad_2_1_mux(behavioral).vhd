LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY quad_2_1_mux IS
    PORT ( 
		enb	: IN STD_LOGIC;
		sel	: IN STD_LOGIC;
		a  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		b  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		f  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	 );
END quad_2_1_mux;

ARCHITECTURE behavioral OF quad_2_1_mux IS

BEGIN
		PROCESS(enb, sel, a, b)
				BEGIN
					IF (enb = '1') THEN
					
						f <= "0000";
					ELSIF (sel = '1') THEN
						f <= b;
					ELSIF (sel = '0') THEN
						f <= a;
					ELSE
						f <= "0000";
					END IF;
		END PROCESS;			
END behavioral;