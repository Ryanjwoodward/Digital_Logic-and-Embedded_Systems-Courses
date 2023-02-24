LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder IS
	PORT(
		x : IN STD_LOGIC;
		y : IN STD_LOGIC;
		cin : IN STD_LOGIC;
		sum : OUT STD_LOGIC;
		cout: OUT STD_LOGIC
	);
END full_adder;

ARCHITECTURE behavior of full_adder IS
		BEGIN
			sum <= (x xor y) xor cin;
			cout <= (x and (y or cin)) or (cin and y);
END behavior;