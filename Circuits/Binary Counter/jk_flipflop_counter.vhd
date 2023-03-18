LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY jk_flipflop_counter IS
	PORT(
		jk_in  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		clk_in : IN STD_LOGIC;
		q_out  : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
		qb_out : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END jk_flipflop_counter;

ARCHITECTURE structural OF jk_flipflop_counter IS 

	COMPONENT jk_flipflop IS
		PORT(
			j : IN STD_LOGIC;
			k : IN STD_LOGIC;
			clk : IN STD_LOGIC;
			set : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			q : OUT STD_LOGIC := '0';
			qb : OUT STD_LOGIC := '1'
		);
	END COMPONENT;

	SIGNAL m1, m2, m3, m4 : STD_LOGIC;
	
	BEGIN
		
		jkff1 : jk_flipflop PORT MAP(jk_in(0), jk_in(0), clk_in, '0', '0', q_out(3), m1);
		jkff2 : jk_flipflop PORT MAP(jk_in(1), jk_in(1), m1, '0', '0', q_out(2), m2);
		jkff3 : jk_flipflop PORT MAP(jk_in(2), jk_in(2), m2, '0', '0', q_out(1), m3);
		jkff4 : jk_flipflop PORT MAP(jk_in(3), jk_in(3), m3, '0', '0', q_out(0), m4);
		
		
		
	
END structural;	