LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY binary_counter IS
	PORT(
		clk : IN STD_LOGIC;
		enable : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END binary_counter;

ARCHITECTURE binary_counter_logic OF binary_counter IS
		SIGNAL count : STD_LOGIC_VECTOR (7  downto 0);
			BEGIN
				PROCESS(clk)
					BEGIN
						IF(RISING_EDGE (clk)) THEN
							IF (reset = '1') THEN
								count <= "00000000";
							ELSIF (enable = '1') THEN
								count <= count + 1;
							END IF;
						END IF;
					END PROCESS;
						output <= count;
				END binary_counter_logic;		