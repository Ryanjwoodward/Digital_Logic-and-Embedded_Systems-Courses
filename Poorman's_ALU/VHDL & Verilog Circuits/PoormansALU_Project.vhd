LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PoormansALU_Project IS
	PORT(
		operand_A	 :  IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		operand_b	 :  IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		select_sw	 :  IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		disp_output  :  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		disp_output2 :  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		carry_output :  OUT STD_LOGIC
	);
END PoormansALU_Project;

ARCHITECTURE structural OF PoormansALU_Project IS

	COMPONENT poormansALU IS
		PORT(
			operand_one : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			operand_two : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			selector	   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			result_out	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			carry_out	: OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT bcd_7segment IS
		PORT(
			bcd_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			seven_segment_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
			seven_segment_out1	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
	END COMPONENT;	

		SIGNAL s1, s2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
		
		BEGIN
			palu : poormansALU  PORT MAP(operand_A, operand_B, select_sw, s1, carry_output);
			bcdc : bcd_7segment PORT MAP(s1, disp_output, disp_output2);
			
END structural;		