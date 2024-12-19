----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2024 23:27:09
-- Design Name: 
-- Module Name: CHANEL - Behavioral
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


entity CHANEL is

port (

    A: inout  std_logic_vector (3 downto 0);
    B: inout std_logic_vector (3 downto 0);
    ENABLE : in std_logic; --when 1 comunicate A with B or B with A, when 0 A outputs 1010 
    D : in std_logic   -- 0 when A => B // 1 when B => A
    
  );
end CHANEL;

architecture Behavioral of CHANEL is
begin
B <= A when D = '0' and ENABLE = '1' else (others => 'Z');
A <= B when D = '1' and ENABLE = '1' else "1111" when ENABLE = '0' else (others => 'Z'); 
end Behavioral;
