LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY lab2_part2 IS
	PORT(
			sw_V_in	:	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			hex_out0	:	OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			hex_out1	:	OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END lab2_part2;

ARCHITECTURE structural of lab2_part2 IS
	
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
             a   :   IN      STD_LOGIC_VECTOR(3 DOWNTO 0);
             z   :   IN      STD_LOGIC_VECTOR(3 DOWNTO 0);
             sel :   IN      STD_LOGIC;
             y   :   OUT     STD_LOGIC_VECTOR(3 DOWNTO 0)
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
	
	SIGNAL	m0, m1, m2 : STD_LOGIC;
	SIGNAL 	n0, n1, n2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	hx0, hx1	  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	
	BEGIN
			circA_inst		: circuit_A PORT MAP(sw_V_in, n0);
			
			fb_comp_inst	: four_bit_comparator PORT MAP(sw_V_in, m0);
			
			cmp_dec_inst	: cmp_decoder PORT MAP(m0, hx1);
			
			f21Mux_inst		: four_bit_2_1_MUX PORT MAP(n0, sw_V_in, m0, n1);
			
			bcd_dec_inst	: bcd_7segment PORT MAP(n1, hx0);
			
			hex_out0	<= hx0;
			hex_out1 <= hx1;
			
END structural;
			