LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY ip_core_quad_mux IS
	PORT
	(
		data0x		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		data1x		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		sel		: IN STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END ip_core_quad_mux;


ARCHITECTURE SYN OF ip_core_quad_mux IS

--	type STD_LOGIC_2D is array (NATURAL RANGE <>, NATURAL RANGE <>) of STD_LOGIC;

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_2D (1 DOWNTO 0, 3 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL sub_wire3	: STD_LOGIC ;
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire5	: STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
	sub_wire2    <= data0x(3 DOWNTO 0);
	sub_wire0    <= data1x(3 DOWNTO 0);
	sub_wire1(1, 0)    <= sub_wire0(0);
	sub_wire1(1, 1)    <= sub_wire0(1);
	sub_wire1(1, 2)    <= sub_wire0(2);
	sub_wire1(1, 3)    <= sub_wire0(3);
	sub_wire1(0, 0)    <= sub_wire2(0);
	sub_wire1(0, 1)    <= sub_wire2(1);
	sub_wire1(0, 2)    <= sub_wire2(2);
	sub_wire1(0, 3)    <= sub_wire2(3);
	sub_wire3    <= sel;
	sub_wire4(0)    <= sub_wire3;
	result    <= sub_wire5(3 DOWNTO 0);

	LPM_MUX_component : LPM_MUX
	GENERIC MAP (
		lpm_size => 2,
		lpm_type => "LPM_MUX",
		lpm_width => 4,
		lpm_widths => 1
	)
	PORT MAP (
		data => sub_wire1,
		sel => sub_wire4,
		result => sub_wire5
	);



END SYN;