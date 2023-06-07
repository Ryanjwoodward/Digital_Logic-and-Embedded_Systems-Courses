LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port (
        A, B, Cin: in std_logic;
        Sum, Cout: out std_logic
    );
end full_adder;


architecture Behavioral of full_adder is
begin
   
    process (A, B, Cin)
		begin
			Sum <= A xor B xor Cin; 
			Cout <= (A and B) or (Cin and (A xor B));
    end process addition_process;
end Behavioral;
