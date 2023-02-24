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

ARCHITECTURE behavioral OF four_bit_adder_subtractor IS

	COMPONENT full_adder IS
		PORT(
			x : IN STD_LOGIC;
			y : IN STD_LOGIC;
			cin : IN STD_LOGIC;
			sum : OUT STD_LOGIC;
			cout: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL c1, c2, c3 : STD_LOGIC;
	
	BEGIN
			fa0: full_adder PORT MAP(a(0), (b(0) XOR cin), cin, sum(0), c1);
			fa1: full_adder PORT MAP(a(1), (b(1) XOR cin), c1, sum(1), c2);
			fa2: full_adder PORT MAP(a(2), (b(2) XOR cin), c2, sum(2), c3);
			fa3: full_adder PORT MAP(a(3), (b(3) XOR cin), c3, sum(3), cout);
		
END behavioral;