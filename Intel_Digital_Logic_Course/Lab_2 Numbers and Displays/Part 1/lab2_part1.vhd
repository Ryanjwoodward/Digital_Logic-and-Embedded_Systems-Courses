LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab2_part1 IS
	PORT(
		
				SW_set_0		:	 IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
				SW_set_1		:	 IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
				HX_dsp_0		:	 OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
				HX_dsp_1		: 	 OUT	STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END lab2_part1;

ARCHITECTURE Behavior OF lab2_part1 IS
		
		COMPONENT bcd_7segment IS
				PORT(
						bcd_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
						seven_segment_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
				);
		END COMPONENT;
		
		SIGNAL m0, m1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
		
		BEGIN
		
				bcd0	:	bcd_7segment PORT MAP(SW_set_0, m0);
				bcd1	:	bcd_7segment PORT MAP(SW_set_1, m1);
				
				HX_dsp_0		<=		m0;
				HX_dsp_1		<=		m1;
		
END Behavior;	