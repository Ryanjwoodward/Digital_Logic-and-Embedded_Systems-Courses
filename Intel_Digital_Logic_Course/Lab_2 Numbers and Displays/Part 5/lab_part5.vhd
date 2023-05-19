LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY lab_part5 IS
	PORT(
			X		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			Y		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			CIN	:	IN		STD_LOGIC;
			HEX0	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1	: 	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX2	: 	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3	: 	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4	: 	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX5	: 	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END lab_part5;

ARCHITECTURE structural OF lab_part5 IS
		
		COMPONENT ripple_carry_adder IS
				PORT(
					A		:		IN STD_LOGIC_VECTOR(3 DOWNTO 0);
					B		:		IN STD_LOGIC_VECTOR(3 DOWNTO 0);
					Cin	:		IN STD_LOGIC;
			
					Sum	: 		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
					Cout	:		OUT STD_LOGIC
				);
		END COMPONENT;
		
		COMPONENT bcd_7segment IS
				PORT(
					bcd_in : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
					seven_segment_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
					seven_segment_out1	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
				);
		END COMPONENT;
		
		SIGNAL sum0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
		SIGNAL cout0 : STD_LOGIC;
		SIGNAL hx0, hx1, hx2, hx3, hx4, hx5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
		
		BEGIN
					rca	:	ripple_Carry_adder PORT MAP(X, Y, CIN, sum0, cout0);
					bcd0	:	bcd_7segment PORT MAP(cout0 & sum0, hx0, hx1);
					bcd1	:  bcd_7segment PORT MAP('0' & X, hx2, hx3);
					bcd2	:	bcd_7segment PORT MAP('0' & Y, hx4, hx5);
					
					HEX0 <= hx0;
					HEX1 <= hx1;
					HEX2 <= hx2;
					HEX3 <= hx3;
					HEX4 <= hx4;
					HEX5 <= hx5;
					
END structural;