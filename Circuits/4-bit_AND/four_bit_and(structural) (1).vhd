LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY four_bit_and IS
	PORT(
		a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		f : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
	
END four_bit_and;

ARCHITECTURE structural OF four_bit_and IS

	COMPONENT
		PORT(
			a : IN STD_LOGIC;
			b : IN STD_LOGIC;
			f : OUT STD_LOGIC
		);
		
	END COMPONENT;

		BEGIN
			abu0 : and_bool_unit PORT MAP(A(0), B(0), F(0));
			abu1 : and_bool_unit PORT MAP(A(1), B(1), F(1));
			abu2 : and_bool_unit PORT MAP(A(2), B(2), F(2));
			abu3 : and_bool_unit PORT MAP(A(3), B(3), F(3));

		
END structural;			
	