LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab1_part6 IS

		PORT (
					SEL	: IN STD_LOGIC_VECTOR(2 DOWNTO 0)			  ;
					HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6)					  ;
					HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6)					  ;
					HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6)				 	  ;
					HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6)					  ;
					HEX4 : OUT STD_LOGIC_VECTOR(0 TO 6)					  ;	
					HEX5 : OUT STD_LOGIC_VECTOR(0 TO 6)					  
		);
		
END lab1_part6;

ARCHITECTURE Structural OF lab1_part6 IS
	
		COMPONENT three_bit_six_one_mux Is
					PORT(
							sw_a   : IN STD_LOGIC_VECTOR(2 DOWNTO 0)	:= "000";
							sw_b   : IN STD_LOGIC_VECTOR(2 DOWNTO 0)	:= "001";
							sw_c   : IN STD_LOGIC_VECTOR(2 DOWNTO 0)	:= "010";
							sw_d   : IN STD_LOGIC_VECTOR(2 DOWNTO 0)	:= "011";
							sw_e	 : IN STD_LOGIC_VECTOR(2 DOWNTO 0)	:= "100";
							sw_f	 : IN STD_LOGIC_VECTOR(2 DOWNTO 0)	:= "101";
							sw_sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0)  ;
							m_out  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
					);
		END COMPONENT;

		COMPONENT bcd_decoder_ext IS
				PORT (
							c : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
							h : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
				);
		END COMPONENT;

		SIGNAL M0, M1, M2, M3, M4, M5 : STD_LOGIC_VECTOR(2 DOWNTO 0);

		BEGIN
				
				U0 : three_bit_six_one_mux PORT MAP("000", "001", "010", "011", "100", "101", SEL, M0);
				U1 : three_bit_six_one_mux PORT MAP("001", "010", "011", "100", "101", "000", SEL, M1);
				U2 : three_bit_six_one_mux PORT MAP("010", "011", "100", "101", "000", "001", SEL, M2);
				U3 : three_bit_six_one_mux PORT MAP("011", "100", "101", "000", "001", "010", SEL, M3);
				U4 : three_bit_six_one_mux PORT MAP("100", "101", "000", "001", "010", "011", SEL, M4);
				U5 : three_bit_six_one_mux PORT MAP("101", "000", "001", "010", "011", "100", SEL, M5);
				
				H0 : bcd_decoder_ext PORT MAP(M0, HEX0);
				H1 : bcd_decoder_ext PORT MAP(M1, HEX1);
				H2 : bcd_decoder_ext PORT MAP(M2, HEX2);
				H3 : bcd_decoder_ext PORT MAP(M3, HEX3);
				H4 : bcd_decoder_ext PORT MAP(M4, HEX4);
				H5 : bcd_decoder_ext PORT MAP(M5, HEX5);
END Structural;

