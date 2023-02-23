LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY quad_2_1_mux IS
    PORT ( 
		E	: IN STD_LOGIC;
		S	: IN STD_LOGIC;
		A  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		B  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		F  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	 );
END quad_2_1_mux;


ARCHITECTURE structural OF quad_2_1_mux IS

	COMPONENT e2_1_mux IS
		PORT(
			enb: IN STD_LOGIC;
			sel: IN STD_LOGIC;
			a  : IN STD_LOGIC;
			b  : IN STD_LOGIC;
			f  : OUT STD_LOGIC
		);
   END COMPONENT;
	
	
	BEGIN	

	
			emux0 : e2_1_mux PORT MAP(E, S, A(0), B(0), F(0));
			emux1 : e2_1_mux PORT MAP(E, S, A(1), B(1), F(1));
			emux2 : e2_1_mux PORT MAP(E, S, A(2), B(2), F(2));
			emux3 : e2_1_mux PORT MAP(E, S, A(3), B(3), F(3));

	
END structural;