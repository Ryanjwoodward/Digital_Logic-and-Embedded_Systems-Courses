library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY two_one_mux IS
  port (
    a : in std_logic;
    b : in std_logic;
    sel : in std_logic;
    y : out std_logic
  );
END two_one_mux;

ARCHITECTURE behavioral OF two_one_mux IS
BEGIN
  y <= a WHEN sel = '0' ELSE b;
END behavioral;