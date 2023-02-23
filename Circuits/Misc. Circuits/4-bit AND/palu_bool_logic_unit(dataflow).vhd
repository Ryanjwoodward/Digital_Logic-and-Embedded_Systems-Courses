LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY palu_bool_logic_unit IS
	PORT(
		a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		f : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
	
END palu_bool_logic_unit;

ARCHITECTURE dataflow OF palu_bool_logic_unit IS

		BEGIN
			f <= a AND b;
		
END dataflow;		