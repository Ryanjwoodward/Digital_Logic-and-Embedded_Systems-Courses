library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_test is
    Port (
        num_in : in  STD_LOGIC_VECTOR(7 downto 0);
        seg_hundreds : out STD_LOGIC_VECTOR(6 downto 0);
        seg_tens : out STD_LOGIC_VECTOR(6 downto 0);
        seg_ones : out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity;

architecture Behavioral of bcd_test is
    signal num_hundreds : std_logic_vector(2 downto 0);
    signal num_tens : std_logic_vector(3 downto 0);
    signal num_ones : std_logic_vector(3 downto 0);
begin
    num_hundreds <= num_in(7 downto 5);
    num_tens <= num_in(4 downto 1);
    num_ones <= num_in(3 downto 0);
    
    process(num_in)
    begin
        case num_hundreds is
            when "000" =>
                seg_hundreds <=  not "0111111" ;  -- 0
            when "001" =>
                seg_hundreds <=  not "0000110" ;  -- 1
            when "010" =>
                seg_hundreds <= not "1011011" ; -- 2
            when "011" =>
                seg_hundreds <=  not "1001111" ;  -- 3
            when "100" =>
                seg_hundreds <= not "1100110" ;  -- 4
            when "101" =>
                seg_hundreds <= not "1101101" ;  -- 5
            when "110" =>
                seg_hundreds <= not "1111101" 	;  -- 6
            when "111" =>
                seg_hundreds <= not "0000111" ; -- 7
            when others =>
                seg_hundreds <= "0000000";  -- Invalid input
        end case;

        case num_tens is
            when "0000" =>
                seg_tens <=  not "0111111" ;  -- 0
            when "0001" =>
                seg_tens <= not "0000110" ;  -- 1
            when "0010" =>
                seg_tens <= not "1011011";  -- 2
            when "0011" =>
                seg_tens <=  not "1001111" ;  -- 3
            when "0100" =>
                seg_tens <= not "1100110" ;  -- 4
            when "0101" =>
                seg_tens <= not "1101101" ;  -- 5
            when "0110" =>
                seg_tens <= not "1111101" 	;  -- 6
            when "0111" =>
                seg_tens <= not "0000111";  -- 7
            when "1000" =>
                seg_tens <= not "1111111" ; -- 8
            when "1001" =>
                seg_tens <= not "1100111";  -- 9
            when others =>
                seg_tens <= "0000000";  -- Invalid input
        end case;

        case num_ones is
				when "0000" =>
					seg_ones <=  not "0111111" ;  -- 0
				when "0001" =>
					seg_ones <= not "0000110" ;  -- 1
				when "0010" =>
					seg_ones <=  not "1011011";  -- 2
				when "0011" =>
					seg_ones <=  not "1001111" ;  -- 3
				when "0100" =>
					seg_ones <= not "1100110" ;  -- 4
				when "0101" =>
					seg_ones <= not "1101101" ;  -- 5
				when "0110" =>
					seg_ones <= not "1111101" 	;  -- 6
				when "0111" =>
					seg_ones <=  not "0000111" ; -- 7
				when "1000" =>
					seg_ones <= not "1111111" ; -- 8
				when "1001" =>
					seg_ones <= not "1100111" ; -- 9
				when others =>
					seg_ones <= "0000000";  -- Invalid input
			end case;
	END PROCESS;
END ARCHITECTURE;