LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parallel_adder IS
	PORT(
		a : IN STD_LOGIC_VECTOR(3 downto 0);
		b : IN STD_LOGIC_VECTOR(3 downto 0);
		sum : OUT STD_LOGIC_VECTOR(3 downto 0);
		cout : OUT STD_LOGIC
	);
END parallel_adder;

ARCHITECTURE behavior of parallel_adder IS
		COMPONENT full_adder IS
			PORT(
				x : IN STD_LOGIC;
				y : IN STD_LOGIC;
				cin : IN STD_LOGIC;
				sum : OUT STD_LOGIC;
				cout: OUT STD_LOGIC
			);
END COMPONENT;

SIGNAL c1, c2, c3, c4 : STD_LOGIC;

BEGIN
				FA0 : full_adder PORT MAP(a(0), b(0), '0', sum(0), c1);
				FA1 : full_adder PORT MAP(a(1), b(1), c1, sum(1), c2);
				FA2 : full_adder PORT MAP(a(2), b(2), c2, sum(2), c3);
				FA3 : full_adder PORT MAP(a(3), b(3), c3, sum(3), c4);
				cout <= c4;
END behavior;	

