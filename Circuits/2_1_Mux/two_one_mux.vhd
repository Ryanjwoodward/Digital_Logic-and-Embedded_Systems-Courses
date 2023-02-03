LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two_one_mux IS
	PORT(
		a : IN STD_LOGIC;
		b : IN STD_LOGIC;
		sel: IN STD_LOGIC;
		Y : OUT STD_LOGIC	
	);
END two_one_mux;

ARCHITECTURE behavioral OF two_one_mux IS
		BEGIN
			Y <= a WHEN sel = '0' ELSE B;
END behavioral;			