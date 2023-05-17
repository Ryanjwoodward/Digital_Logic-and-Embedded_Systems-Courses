LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY four_bit_2_1_MUX IS 
            PORT(
                    a   :   IN      STD_LOGIC_VECTOR(3 DOWNTO 0);
                    z   :   IN      STD_LOGIC_VECTOR(3 DOWNTO 0);
                    sel :   IN      STD_LOGIC;
                    y   :   OUT     STD_LOGIC_VECTOR(3 DOWNTO 0)
            );
END four_bit_2_1_MUX;

ARCHITECTURE behavioral OF four_bit_2_1_MUX IS 
            BEGIN
                    PROCESS (a, z, sel)
                        BEGIN 
                            IF (sel = '0') THEN
                                y <= a;
                            ELSE 
                                y <= z;
                            END IF;
                    END PROCESS;
END behavioral;