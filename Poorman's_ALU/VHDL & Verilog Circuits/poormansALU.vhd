LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY poormansALU IS
			
		PORT(
			operand_one : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			operand_two : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			selector	   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			result_out	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			carry_out	: OUT STD_LOGIC
			
		);
		
END poormansALU;

ARCHITECTURE dataflow OF poormansALU  IS

		COMPONENT four_bit_adder_subtractor IS
			PORT(
				cin 		: IN STD_LOGIC;
				a			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				b			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				cout		: OUT STD_LOGIC;
				sum		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
		END COMPONENT;
		
		COMPONENT palu_bool_logic_unit IS
			PORT(
				u : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				w : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				e : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
		END COMPONENT;	
			
		
		COMPONENT quad_2_1_mux IS
			PORT(
				enb	: IN STD_LOGIC;
				sel	: IN STD_LOGIC;
				x  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				y  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				f  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
			
		END COMPONENT;
		
		SIGNAL midl1, midl2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
		
		BEGIN
								fas1 : four_bit_adder_subtractor PORT MAP(selector(0), operand_one, operand_two, carry_out, midl1);
								pblu : palu_bool_logic_unit PORT MAP(operand_one, operand_two, midl2);
		
								qdmx : quad_2_1_mux PORT MAP('0', selector(1), midl1, midl2, result_out);
					
		
END dataflow;