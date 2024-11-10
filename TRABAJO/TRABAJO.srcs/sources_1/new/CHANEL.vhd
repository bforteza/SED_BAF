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
    ENABLE : in std_logic   
    
  );
end CHANEL;

architecture Behavioral of CHANEL is

process(ENABLE, A, B)
    begin
        if ENABLE = '1' then
            -- Asigna A a B y B a A solo si ENABLE es 1
            A <= B;
            B <= A;
        else
            -- En caso de no estar habilitado, se ponen ambas señales en alta impedancia
            A <= (others => 'Z');
            B <= (others => 'Z');
        end if;
    end process;
end Behavioral;
