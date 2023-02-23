LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY quad_2_1_mux IS
    PORT ( 
		enb	: IN STD_LOGIC;
		sel	: IN STD_LOGIC;
		a  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		b  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		f  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	 );
END quad_2_1_mux;

ARCHITECTURE data_flow OF quad_2_1_mux IS
	BEGIN
		f(0)  <=  (a(0) AND NOT enb AND NOT sel) OR (b(0) AND NOT enb AND sel);
		f(1)  <=  (a(1) AND NOT enb AND NOT sel) OR (b(1) AND NOT enb AND sel);
		f(2)  <=  (a(2) AND NOT enb AND NOT sel) OR (b(2) AND NOT enb AND sel);
		f(3)  <=  (a(3) AND NOT enb AND NOT sel) OR (b(3) AND NOT enb AND sel);

END data_flow;