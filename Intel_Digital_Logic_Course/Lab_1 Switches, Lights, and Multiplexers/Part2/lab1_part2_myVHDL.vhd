library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY lab1_part2 IS
  port (
    a : in std_logic;
    b : in std_logic;
    sel : in std_logic;
    y : out std_logic
  );
END lab1_part2;

ARCHITECTURE behavioral OF lab1_part2 IS
BEGIN
  y <= a WHEN sel = '0' ELSE b;
END behavioral;
