LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY lab2_part5 IS 
	PORT(
			A		: IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
			HEX0	: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE structural OF lab2_part5 IS

	COMPONENT bcd_7segment IS
		PORT(
			bcd_in : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			seven_segment_out 	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
			seven_segment_out1	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
	END COMPONENT;
	
	BEGIN
			bcd0	: bcd_7segment PORT MAP(A, HEX0, HEX1);

END ARCHITECTURE;