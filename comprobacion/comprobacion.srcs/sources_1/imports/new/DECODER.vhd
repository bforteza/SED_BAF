----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2024 12:47:50
-- Design Name: 
-- Module Name: DECODER - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DECODER is
generic(
    WIDHT : positive := 3);
  Port ( 
    S : in  std_logic_vector (WIDHT-1 downto 0);
    O: out std_logic_vector (2**WIDHT-1 downto 0);
    ENABLE : in std_logic
    );
end DECODER;

architecture Behavioral of DECODER is

begin
  process (S, ENABLE)
  begin
    -- Inicializar todas las salidas a '0' cuando ENABLE está en '0'
    if ENABLE = '0' then
      O <= (others => '0');
    else
      -- Establecer el bit seleccionado en '1' de acuerdo con el valor de S
      O <= (others => '0');  -- Primero poner todos los bits a '0'
      O(to_integer(unsigned(S))) <= '1';
    end if;
  end process;
end Behavioral;


