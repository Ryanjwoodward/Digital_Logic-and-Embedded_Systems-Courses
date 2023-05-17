LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY four_bit_comparator IS 
	PORT(
			V		:   IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			Z		:   OUT STD_LOGIC
		);
END four_bit_comparator;

ARCHITECTURE dataflow OF four_bit_comparator IS 
	
	BEGIN
			Z <= (V(3) AND V(1)) OR (V(3) AND V(2));
END dataflow;			
