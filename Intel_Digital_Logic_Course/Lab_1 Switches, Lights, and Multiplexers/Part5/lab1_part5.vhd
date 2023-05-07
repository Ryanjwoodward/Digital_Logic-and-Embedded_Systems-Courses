LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab1_part5 IS

		PORT (
					SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
					LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
					HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6);
					HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6);
					HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6);
					HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6)
		);
		
END lab1_part5;

ARCHITECTURE Behavior OF lab1_part5 IS
	
		COMPONENT two_bit_four_one_mux
				PORT (
							u : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
							v : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
							w : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
							x : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
							s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
							m : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
				);
		END COMPONENT;

		COMPONENT bcd_decoder
				PORT (
							c : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
							h : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
				);
		END COMPONENT;

		SIGNAL M0, M1, M2, M3 : STD_LOGIC_VECTOR(1 DOWNTO 0);

		BEGIN
				LEDR <= SW;
				U0 : two_bit_four_one_mux PORT MAP(
								
														SW(9 DOWNTO 8), SW(7 DOWNTO 6), SW(5 DOWNTO 4), SW(3 DOWNTO 2), SW(1 DOWNTO 0), M0
													);
				U1 : two_bit_four_one_mux PORT MAP(
								
														SW(7 DOWNTO 6), SW(5 DOWNTO 4), SW(3 DOWNTO 2), SW(9 DOWNTO 8), SW(1 DOWNTO 0), M1
													);	
				U2 : two_bit_four_one_mux PORT MAP(
								
														SW(5 DOWNTO 4), SW(3 DOWNTO 2), SW(9 DOWNTO 8), SW(7 DOWNTO 6), SW(1 DOWNTO 0), M2
													);			
				U3 : two_bit_four_one_mux PORT MAP(
								
														SW(3 DOWNTO 2), SW(9 DOWNTO 8), SW(7 DOWNTO 6), SW(5 DOWNTO 4), SW(1 DOWNTO 0), M3
													);	
	
				H0 : bcd_decoder PORT MAP(M0, HEX0);
				H1 : bcd_decoder PORT MAP(M1, HEX1);
				H2 : bcd_decoder PORT MAP(M2, HEX2);
				H3 : bcd_decoder PORT MAP(M3, HEX3);
END Behavior;

