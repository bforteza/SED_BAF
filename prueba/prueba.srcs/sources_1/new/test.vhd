----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2024 12:22:37
-- Design Name: 
-- Module Name: test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity e1 is
    generic (
        n: positive := 2
    );
    port (
        a, b, c: in  std_logic;
        y: out std_logic
    );
end e1;

architecture a1 of e1 is
    signal r1: std_logic_vector(1 downto 0);
    signal s1: std_logic;
begin
    r1 <= (others => '0') when a = '0' else
          r1(0) & c when b'event and b = '1';

    process (a, b)
        variable count: natural range 0 to n;
    begin
        if a = '0' then
            count := 0;
            s1 <= '0';
            y <= '0';
        elsif b'event and b = '1' then
            if r1(1) = '1' and count = 0 then
                s1 <= '1';
                count := n;
            elsif count /= 0 then
                count := count - 1;
            end if;

            if s1 /= '0' then
                s1 <= '0';
            end if;

            y <= s1;
        end if;
    end process;
end a1;
