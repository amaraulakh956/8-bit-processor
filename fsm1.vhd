library ieee;
use ieee.std_logic_1164.all;

entity fsm1 is
    port(
        clk           : in std_logic;
        data_in       : in std_logic;
        reset         : in std_logic;
        student_id    : out std_logic_vector(3 downto 0);
        current_state : out std_logic_vector(3 downto 0)
    );
end entity;

architecture Behavior of fsm1 is

    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
    signal y : state_type;

begin

    --------------------------------------------------------
    -- STATE TRANSITION PROCESS
    --------------------------------------------------------
    process(clk, reset)
    begin
        if reset = '1' then
            y <= s0;                         -- reset forces initial state
        elsif rising_edge(clk) then
            if data_in = '0' then            -- remain in same state
                y <= y;
            else                              -- data_in = '1' -> advance
                case y is
                    when s0 => y <= s1;
                    when s1 => y <= s2;
                    when s2 => y <= s3;
                    when s3 => y <= s4;
                    when s4 => y <= s5;
                    when s5 => y <= s6;
                    when s6 => y <= s7;
                    when s7 => y <= s8;
                    when s8 => y <= s0;
                end case;
            end if;
        end if;
    end process;


    --------------------------------------------------------
    -- OUTPUT PROCESS (Moore output)
    -- Student Number = 501303776
    -- BCD:
    --   5 -> 0101
    --   0 -> 0000
    --   1 -> 0001
    --   3 -> 0011
    --   0 -> 0000
    --   3 -> 0011
    --   7 -> 0111
    --   7 -> 0111
    --   6 -> 0110
    --------------------------------------------------------
    process(y)
    begin
        case y is

            when s0 =>
                current_state <= "0000";
                student_id    <= "0101";     -- 5

            when s1 =>
                current_state <= "0001";
                student_id    <= "0000";     -- 0

            when s2 =>
                current_state <= "0010";
                student_id    <= "0001";     -- 1

            when s3 =>
                current_state <= "0011";
                student_id    <= "0011";     -- 3

            when s4 =>
                current_state <= "0100";
                student_id    <= "0000";     -- 0

            when s5 =>
                current_state <= "0101";
                student_id    <= "0011";     -- 3

            when s6 =>
                current_state <= "0110";
                student_id    <= "0111";     -- 7

            when s7 =>
                current_state <= "0111";
                student_id    <= "0111";     -- 7

            when s8 =>
                current_state <= "1000";
                student_id    <= "0110";     -- 6

            when others =>
                current_state <= "1111";
                student_id    <= "1111";     -- safety/default

        end case;
    end process;

end Behavior;