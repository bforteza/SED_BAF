----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 16:26:54
-- Design Name: 
-- Module Name: Dec_7_seg - Behavioral
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

entity bcd_to_7seg is
  port (
    bcd : in  std_logic_vector(3 downto 0); -- Entrada BCD de 4 bits
    seg : out std_logic_vector(6 downto 0)  -- Salida para el display de 7 segmentos
  );
end bcd_to_7seg;

architecture Behavioral of bcd_to_7seg is
begin
  process(bcd)
  begin
    case bcd is
      when "0000" => seg <= "1000000"; -- 0
      when "0001" => seg <= "1111001"; -- 1
      when "0010" => seg <= "0100100"; -- 2
      when "0011" => seg <= "0110000"; -- 3
      when "0100" => seg <= "0011001"; -- 4
      when "0101" => seg <= "0010010"; -- 5
      when "0110" => seg <= "0000010"; -- 6
      when "0111" => seg <= "1111000"; -- 7
      when "1000" => seg <= "0000000"; -- 8
      when "1001" => seg <= "0010000"; -- 9
      when "1010" => seg <= "1111111"; --NO DISPLAY
      when others => seg <= "0000110"; -- E            
    end case;
  end process;
end Behavioral;
