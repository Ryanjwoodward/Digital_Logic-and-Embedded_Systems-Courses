LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY e2_1_mux IS
    PORT ( 
		enb: IN STD_LOGIC;
		sel: IN STD_LOGIC;
		a  : IN STD_LOGIC;
		b  : IN STD_LOGIC;
		f  : OUT STD_LOGIC
	 );
END e2_1_mux;


ARCHITECTURE data_flow OF e2_1_mux IS
BEGIN
   
	f <= (NOT enb AND ((a AND NOT sel) OR (b AND sel)));
	
END data_flow;