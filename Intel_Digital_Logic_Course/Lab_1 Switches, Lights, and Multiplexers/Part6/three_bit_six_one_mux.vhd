LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY three_bit_six_one_mux IS
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
END three_bit_six_one_mux;

ARCHITECTURE behavior OF three_bit_six_one_mux IS
		
BEGIN
		PROCESS(sw_sel)
			BEGIN
				CASE sw_sel IS
					WHEN "000"  => 
						m_out <= sw_a;
					WHEN "001"  =>
						m_out <= sw_b;
					WHEN "010"  =>
						m_out <= sw_c;
					WHEN "011"  =>
						m_out <= sw_d;
					WHEN "100"  =>
						m_out <= sw_e;
					WHEN "101"  =>
						m_out <= sw_f;	
					WHEN OTHERS =>
						m_out <= "111";
				END CASE;
		END PROCESS;		
END behavior;	


--Copy code   constant CHAR_A : std_logic_vector(6 downto 0) := "0111111";