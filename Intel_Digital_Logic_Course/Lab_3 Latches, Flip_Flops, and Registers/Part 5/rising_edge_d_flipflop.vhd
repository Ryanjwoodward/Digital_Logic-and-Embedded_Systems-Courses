library ieee;
use ieee.std_logic_1164.all;

entity rising_edge_d_flipflop is
	port (
		d      : in  std_logic_vector(3 downto 0);
		clk    : in  std_logic;
		reset  : in  std_logic;
		q      : out std_logic_vector(3 downto 0)
	);
end entity;

architecture rtl of rising_edge_d_flipflop is
	signal m : std_logic_vector(3 downto 0);
begin
	process(clk, reset)
		begin
				if reset = '1' then
					q <= "0000";
				elsif rising_edge(clk) then
					q <= d;
				end if;
		end process;
end rtl;
