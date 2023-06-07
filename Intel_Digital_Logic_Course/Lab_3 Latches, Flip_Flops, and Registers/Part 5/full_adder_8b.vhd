LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder_8b IS
	PORT(
		a : IN STD_LOGIC_VECTOR(7 downto 0);
		b : IN STD_LOGIC_VECTOR(7 downto 0);
		sum : OUT STD_LOGIC_VECTOR(7 downto 0);
		cout : OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE behavior of full_adder_8b IS
		COMPONENT full_adder IS
			port (
				A, B, Cin: in std_logic;
				Sum, Cout: out std_logic
			);
END COMPONENT;

SIGNAL c1, c2, c3, c4, c5, c6, c7 : STD_LOGIC;

BEGIN
				FA0 : full_adder PORT MAP(a(0), b(0), '0', sum(0), c1);
				FA1 : full_adder PORT MAP(a(1), b(1), c1, sum(1), c2);
				FA2 : full_adder PORT MAP(a(2), b(2), c2, sum(2), c3);
				FA3 : full_adder PORT MAP(a(3), b(3), c3, sum(3), c4);
				
				FA4 : full_adder PORT MAP(a(4), b(4), c4, sum(4), c5);
				FA5 : full_adder PORT MAP(a(5), b(5), c5, sum(5), c6);
				FA6 : full_adder PORT MAP(a(6), b(6), c6, sum(6), c7);
				FA7 : full_adder PORT MAP(a(7), b(7), c7, sum(7), cout);
				
END ARCHITECTURE;	
