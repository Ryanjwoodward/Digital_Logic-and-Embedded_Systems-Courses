LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY lab2_part4 IS
	PORT(
			X		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			Y		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			CIN	:	IN		STD_LOGIC;
			HEX0	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1	: 	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END lab2_part4;

ARCHITECTURE structural OF lab2_part4 IS
		
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
		
		BEGIN
					rca	:	ripple_Carry_adder PORT MAP(X, Y, CIN, sum0, cout0);
					bcd	:	bcd_7segment PORT MAP(cout0 & sum0, HEX0, HEX1);
		
		
END structural;
