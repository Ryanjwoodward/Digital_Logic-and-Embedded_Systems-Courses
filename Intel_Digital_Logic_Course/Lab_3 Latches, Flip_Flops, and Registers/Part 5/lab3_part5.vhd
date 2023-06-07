LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY lab3_part5 IS
	PORT(
			SW		  :		IN STD_LOGIC_VECTOR(7 DOWNTO 0);	-- Used for 8 bit values A and B
			clk_btn :	   IN STD_LOGIC;
			rst_btn :		IN STD_LOGIC;
			HX_A_3  :	  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);	-- Used to display the value of A
			HX_A_2  :	  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);	-- Used to display the value of A
			HX_B_1  :	  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);	-- Used to display the value of B\
			HX_B_0  :	  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);	-- Used to display the value of B
			HX_S_5  :     OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HX_S_4  : 	  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			COUT	  :	  OUT STD_LOGIC	
	);
END ENTITY;

ARCHITECTURE rtl OF lab3_part5 IS

	SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL B : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL S : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	
	COMPONENT bcd_7segment IS
		PORT (
			bcd_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			seven_segment_out : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
			seven_segment_out1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT full_adder_8b IS
		PORT(
			a : IN STD_LOGIC_VECTOR(7 downto 0);
			b : IN STD_LOGIC_VECTOR(7 downto 0);
			sum : OUT STD_LOGIC_VECTOR(7 downto 0);
			cout : OUT STD_LOGIC
		);
	END COMPONENT;
	
	BEGIN
			PROCESS(clk_btn, rst_btn, SW)
			
			variable clk_count : natural range 0 to 2 := 0;

				BEGIN
							IF (rst_btn = '1')      THEN	
								-- assign all hexes and cout to 0 and make the clk_count variable 0 again
								HX_A_3	<= NOT "1000000";
								HX_A_2	<= NOT "1000000";
								HX_B_1	<= NOT "1000000";
								HX_B_0	<= NOT "1000000";
								HX_S_5   <= NOT "1000000";
								HX_S_4	<= NOT "1000000";
								COUT		<= '0';
								
							ELSIF (clk_count = 0) THEN
								-- assign the value of the SW to A and send A to HEX_A
								-- incrment clk_count variable
								A	<= SW;
								clk_count := 1;
								
							ELSIF (clk_count = 1) THEN
								-- assign the value of the SW to B and send B to HEX_B
								-- increment the clk variable
								B <= SW;
								clk_count := 2;
								
							ELSIF (clk_count = 2) THEN
								-- pass A & B to the full_adder_8_b have the sum of that be passed to the HEX_S
								-- reset the clock_count variable
								clk_count := 0;
								
							ELSE
								-- set all variables to dash '-'
								HX_A_3	<= NOT "1000100";
								HX_A_2	<= NOT "1000100";
								HX_B_1	<= NOT "1000100";
								HX_B_0	<= NOT "1000100";
								HX_S_5   <= NOT "1000100";
								HX_S_4	<= NOT "1000100";
								COUT		<= '0';
							END IF;
			END PROCESS;
			
			HEX32	: bcd_7segment  PORT MAP(A, HX_A_2, HX_A_3);
			HEX10	: bcd_7segment  PORT MAP(B, HX_B_0, HX_B_1);
			FA8b	: full_adder_8b PORT MAP(A, B, S, COUT);
			HEX54 : bcd_7segment  PORT MAP(S, HX_s_4, HX_S_5);
			
			
END ARCHITECTURE;
