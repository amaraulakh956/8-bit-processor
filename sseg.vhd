LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
    PORT (bcd :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          sign : IN STD_LOGIC;
          leds :OUT STD_LOGIC_VECTOR(1 TO 7);
          leds2 : OUT STD_LOGIC_VECTOR(1 TO 7)
    );
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN

    PROCESS (sign)
    BEGIN
        IF (sign = '1') THEN
            leds2 <= NOT ("0000001");
        ELSE
            leds2 <= NOT ("0000000");
        END IF;
    END PROCESS;

    PROCESS (bcd)
    BEGIN
        --                    abcdefg
        CASE bcd IS
            WHEN "0000" => leds <= NOT ("1111110");
            WHEN "0001" => leds <= NOT ("0110000");
            WHEN "0010" => leds <= NOT ("1101101");
            WHEN "0011" => leds <= NOT ("1111001");
            WHEN "0100" => leds <= NOT ("0110011");
            WHEN "0101" => leds <= NOT ("1011011");
            WHEN "0110" => leds <= NOT ("1011111");
            WHEN "0111" => leds <= NOT ("1110000");
            WHEN "1000" => leds <= NOT ("1111111");
            WHEN "1001" => leds <= NOT ("1111011");
            WHEN "1010" => leds <= NOT ("1110111");
            WHEN "1011" => leds <= NOT ("0011111");
            WHEN "1100" => leds <= NOT ("1001110");
            WHEN "1101" => leds <= NOT ("0111101");
            WHEN "1110" => leds <= NOT ("1001111");
            WHEN "1111" => leds <= NOT ("1000111");
            WHEN OTHERS => leds <= "-------";
        END CASE;
    END PROCESS;

END Behavior;