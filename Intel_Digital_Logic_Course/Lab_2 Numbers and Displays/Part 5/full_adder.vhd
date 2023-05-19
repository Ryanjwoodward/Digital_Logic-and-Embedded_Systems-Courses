library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        a	: IN STD_LOGIC;
		  b	: IN STD_LOGIC;
		  cin : IN STD_LOGIC;
        sum	: OUT STD_LOGIC; 
		  cout : out STD_LOGIC
    );
end full_adder;

architecture Behavioral of full_Adder is
begin
    process(A, B, Cin)
    begin
        if (A = '0' and B = '0' and Cin = '0') then
            Sum <= '0';
            Cout <= '0';
        elsif (A = '0' and B = '0' and Cin = '1') then
            Sum <= '1';
            Cout <= '0';
        elsif (A = '0' and B = '1' and Cin = '0') then
            Sum <= '1';
            Cout <= '0';
        elsif (A = '0' and B = '1' and Cin = '1') then
            Sum <= '0';
            Cout <= '1';
        elsif (A = '1' and B = '0' and Cin = '0') then
            Sum <= '1';
            Cout <= '0';
        elsif (A = '1' and B = '0' and Cin = '1') then
            Sum <= '0';
            Cout <= '1';
        elsif (A = '1' and B = '1' and Cin = '0') then
            Sum <= '0';
            Cout <= '1';
        elsif (A = '1' and B = '1' and Cin = '1') then
            Sum <= '1';
            Cout <= '1';
        end if;
    end process;
end Behavioral;