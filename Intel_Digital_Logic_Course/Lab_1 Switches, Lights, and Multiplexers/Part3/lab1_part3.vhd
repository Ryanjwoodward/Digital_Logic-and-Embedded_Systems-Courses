LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab1_part3 IS
	PORT(
		u : IN STD_LOGIC;
		v : IN STD_LOGIC;
		w : IN STD_LOGIC;
		x : IN STD_LOGIC;
		s1 : IN STD_LOGIC;
		s2 : IN STD_LOGIC;
		m : OUT STD_LOGIC
	);
END lab1_part3;

ARCHITECTURE behavior OF lab1_part3 IS
		COMPONENT two_one_mux IS
			PORT(
				a : IN STD_LOGIC;
				b : IN STD_LOGIC;
				sel: IN STD_LOGIC;
				y : OUT STD_LOGIC
			);
END COMPONENT;

SIGNAL c1, c2, c3: STD_LOGIC;

BEGIN
		mux1 : two_one_mux PORT MAP(u, v, s1, c1);
		mux2 : two_one_mux PORT MAP(w, x, s1, c2);
		mux3 : two_one_mux PORT MAP(c1, c2, s2, c3);
		m <= c3;
		
				
END behavior;	
