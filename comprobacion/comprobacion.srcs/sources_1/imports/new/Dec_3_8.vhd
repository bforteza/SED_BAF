----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 16:40:08
-- Design Name: 
-- Module Name: Dec_3_8 - Behavioral
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
use IEEE.std_logic_1164.all;

entity binary_3bit_decoder is
  port (
    binary_in : in  std_logic_vector(2 downto 0); -- Entrada binaria de 3 bits
    output    : out std_logic_vector(7 downto 0)  -- Salidas activas bajas (8 salidas)
  );
end binary_3bit_decoder;

architecture Behavioral of binary_3bit_decoder is
begin
  process(binary_in)
  begin
    -- Inicializar todas las salidas en '1' (inactivo bajo)
    output <= "11111111";

    case binary_in is
      when "000" => output <= "01111111"; -- Activar salida 0
      when "001" => output <= "10111111"; -- Activar salida 1
      when "010" => output <= "11011111"; -- Activar salida 2
      when "011" => output <= "11101111"; -- Activar salida 3
      when "100" => output <= "11110111"; -- Activar salida 4
      when "101" => output <= "11111011"; -- Activar salida 5
      when "110" => output <= "11111101"; -- Activar salida 6
      when "111" => output <= "11111110"; -- Activar salida 7
      when others => output <= "11111111"; -- Desactivar todas las salidas (por seguridad)
    end case;
  end process;
end Behavioral;
