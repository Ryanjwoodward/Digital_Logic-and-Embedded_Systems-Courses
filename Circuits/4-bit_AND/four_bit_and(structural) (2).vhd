LIBRARY ieee;
USE ieee.std_logic_1164.all

ENTITY and_bool_unit IS
	PORT(
		a : IN STD_LOGIC;
		b : IN STD_LOGIC;
		f : OUT STD_LOGIC
	);
END and_bool_unit;

ARCHITECTURE structural OF and_bool_unit IS
		BEGIN
			f <= a AND b;
END structural;	
	