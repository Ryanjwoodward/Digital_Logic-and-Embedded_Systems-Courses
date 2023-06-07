library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop is
	port (
		D      : in  std_logic_vector(3 DOWNTO 0);
		CLK    : in  std_logic;
		RESET  : in  std_logic;
		Q      : out std_logic_VECTOR(3 DOWNTO 0);
		Q2		 : out std_logic_VECTOR(3 DOWNTO 0)
	);
end entity;

architecture rtl of d_flipflop is

	COMPONENT falling_edge_d_flipflop IS
		port (
			d      : in  std_logic_vector(3 downto 0);
			clk    : in  std_logic;
			reset  : in  std_logic;
			q      : out std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT rising_edge_d_flipflop IS
		port (
			d      : in  std_logic_vector(3 downto 0);
			clk    : in  std_logic;
			reset  : in  std_logic;
			q      : out std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	-- intermediate signals
	
	begin
			
			dff0	:	falling_edge_d_flipflop PORT MAP(D, CLK, RESET, Q);
			dff1	:	rising_edge_d_flipflop	PORT MAP(D, CLK, RESET, Q2);

end rtl;
