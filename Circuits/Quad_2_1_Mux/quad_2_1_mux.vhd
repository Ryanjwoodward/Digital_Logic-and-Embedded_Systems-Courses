library ieee;
use ieee.std_logic_1164.all;

entity quad_2_1_mux is
    Port ( sel : in  std_logic_vector(1 downto 0);
           a : in  std_logic_vector(3 downto 0);
           b : in  std_logic_vector(3 downto 0);
           y : out  std_logic_vector(3 downto 0));
end quad_2_1_mux;

architecture data_flow of quad_2_1_mux is
begin
    y(0) <= a(0) when (sel(0) = '0' AND sel(1) = '0') else b(0) when sel(1) = '0';
    y(1) <= a(1) when (sel(0) = '0' AND sel(1) = '0') else b(1) when sel(1) = '0';
    y(2) <= a(2) when (sel(0) = '0' AND sel(1) = '0') else b(2) when sel(1) = '0';
    y(3) <= a(3) when (sel(0) = '0' AND sel(1) = '0') else b(3) when sel(1) = '0';
end data_flow;
