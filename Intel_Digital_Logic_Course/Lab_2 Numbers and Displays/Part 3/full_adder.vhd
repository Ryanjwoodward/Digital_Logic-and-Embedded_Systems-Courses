LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY full_adder IS
	PORT(
			a		:		IN STD_LOGIC;
			b		:		IN STD_LOGIC;
			cin	:		IN STD_LOGIC;
			
			sum	:		OUT STD_LOGIC;
			cout	:		OUT STD_LOGIC
	);
END full_adder;
	
ARCHITECTURE dataflow OF full_adder IS
	
	BEGIN
		
			sum  <= a XOR b XOR cin;
			cout <= (a AND b) OR (cin AND a) or (cin AND b);
			
END dataflow;