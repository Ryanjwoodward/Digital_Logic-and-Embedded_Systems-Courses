LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two_bit_four_one_mux IS
	PORT(
		u : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		v : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		w : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		x : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		m : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END two_bit_four_one_mux;

ARCHITECTURE behavior OF two_bit_four_one_mux IS
		
BEGIN
		PROCESS(s)
			BEGIN
				CASE s IS
					WHEN "00" => 
						m <= u;
					WHEN "01" =>
						m <= v;
					WHEN "10" =>
						m <= w;
					WHEN "11" =>
						m <= x;
					WHEN OTHERS =>
						m <= "00";
				END CASE;
		END PROCESS;		
END behavior;	