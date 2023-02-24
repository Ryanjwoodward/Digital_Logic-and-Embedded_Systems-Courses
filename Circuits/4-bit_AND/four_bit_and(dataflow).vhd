LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY four_bit_and IS
	PORT(
		a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		f : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	);
	
END four_bit_and;

ARCHITECTURE dataflow OF four_bit_and IS

		BEGIN
			f <= a AND b;
END dataflow;			
	