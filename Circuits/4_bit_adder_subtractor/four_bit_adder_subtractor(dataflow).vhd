LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY four_bit_adder_subtractor IS
			
		PORT(
			cin 		: IN STD_LOGIC;
			a			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			b			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			cout		: OUT STD_LOGIC;
			sum		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
		
END four_bit_adder_subtractor;

ARCHITECTURE dataflow OF four_bit_adder_subtractor IS
SIGNAL i1, i2, i3 : STD_LOGIC;

BEGIN

		sum(0) <= (cin XOR (a(0) XOR (b(0) XOR cin)));
		i1 	 <= (a(0) AND (b(0) XOR cin)) OR (cin AND (a(0) XOR (b(0) XOR cin)));
		
		sum(1) <= (i1 XOR (a(1) XOR (b(1) XOR cin)));
		i2 	 <= (a(1) AND (b(1) XOR cin)) OR (i1 AND (a(1) XOR (b(1) XOR cin)));
		
		sum(2) <= (i2 XOR (a(2) XOR (b(2) XOR cin)));
		i3 	 <= (a(2) AND (b(2) XOR cin)) OR (i2 AND (a(2) XOR (b(2) XOR cin)));
		
		sum(3) <= (i3 XOR (a(3) XOR (b(3) XOR cin)));
		cout 	 <= (a(3) AND (b(3) XOR cin)) OR (i3 AND (a(3) XOR (b(3) XOR cin)));

		
		
END dataflow;