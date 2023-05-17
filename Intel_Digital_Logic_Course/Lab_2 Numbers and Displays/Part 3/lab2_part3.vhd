LIBRARY ieee;
USE ieee.std_logic_1164.all ;

--ripple carry adder

ENTITY lab2_part3 IS
	PORT(
			A		:		IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			B		:		IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Cin	:		IN STD_LOGIC;
			
			Sum	: 		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Cout	:		OUT STD_LOGIC
	);
END lab2_part3;

ARCHITECTURE structural OF lab2_part3 IS
	
	COMPONENT full_adder IS
		PORT(
			a		:		IN STD_LOGIC;
			b		:		IN STD_LOGIC;
			cin	:		IN STD_LOGIC;
			
			sum	:		OUT STD_LOGIC;
			cout	:		OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL m0, m1, m2, m3 : STD_LOGIC;
	
	BEGIN
	
		fa0	:	full_adder PORT MAP(A(0), B(0), Cin, Sum(0), m0);
		fa1	: 	full_adder PORT MAP(A(1), B(1), m0, Sum(1), m1);
		fa2	:	full_adder PORT MAP(A(2), B(2), m1, Sum(2), m2);
		fa3	:	full_adder PORT MAP(A(3), B(3), m2, Sum(3), Cout);

	END structural;