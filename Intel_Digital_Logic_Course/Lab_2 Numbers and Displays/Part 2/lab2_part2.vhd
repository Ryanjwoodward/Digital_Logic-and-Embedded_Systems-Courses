LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY lab2_part2 IS
	PORT(
			SW		:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			HEX0	:	OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1	: 	OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END lab2_part2;

ARCHITECTURE structural OF lab2_part2 IS
	
	COMPONENT circuit_A IS
			PORT(
				vin	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				aout	:  OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	END COMPONENT;
	
	COMPONENT four_bit_comparator IS
			PORT(
				V		:   IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
				Z		:   OUT STD_LOGIC
			);
	END COMPONENT;
	
	COMPONENT four_bit_2_1_MUX IS
			PORT(
             a    :   IN      STD_LOGIC_VECTOR(3 DOWNTO 0);
             v_in :   IN      STD_LOGIC_VECTOR(3 DOWNTO 0);
             sel  :   IN      STD_LOGIC;
             y    :   OUT     STD_LOGIC_VECTOR(3 DOWNTO 0)
            );
	END COMPONENT;
	
	COMPONENT bcd_7segment IS
			PORT(
				bcd_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				seven_segment_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
			);
	END COMPONENT;
	
	COMPONENT cmp_decoder IS
			PORT(
				z_in : IN STD_LOGIC;
				seven_seg_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
			);
	END COMPONENT;
	
	SIGNAL circA_result	: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL z_result		: STD_LOGIC;
	SIGNAL mux_result		: STD_LOGIC_VECTOR(3 DOWNTO 0);


	BEGIN	
	
			comprtr	:	four_bit_comparator PORT MAP(SW, z_result);
			cmp_dec	:	cmp_decoder			  PORT MAP(z_result, HEX1);
	
			circA		:	circuit_A PORT MAP(SW, circA_result);
			
			fb_mux	: four_bit_2_1_MUX PORT MAP(circA_result, SW, z_result, mux_result);
			bcd_dec	: bcd_7segment PORT MAP(mux_result, HEX0);
		
END structural;
	