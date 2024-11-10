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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CHANEL is
generic(
    WIDHT : positive := 4);
port (
    A: inout  std_logic_vector (WIDHT-1 downto 0);
    B: inout std_logic_vector (WIDHT-1 downto 0);
    ENABLE : in std_logic;
    D : in std_logic   -- 0 when A => B // 1 when B => A
    
  );
end CHANEL;

architecture Behavioral of CHANEL is
begin
B <= A when D = '0' and ENABLE = '1' else (others => 'Z');
A <= B when D = '1' and ENABLE = '1' else (others => 'Z');

end Behavioral;
