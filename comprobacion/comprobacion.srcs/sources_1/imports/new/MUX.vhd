----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 16:10:18
-- Design Name: 
-- Module Name: MUX - Behavioral
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
use IEEE.numeric_std.all;

entity mux_32bit_4out is
  port (
    data_in : in  std_logic_vector(31 downto 0); -- Entrada de 32 bits
    sel     : in  std_logic_vector(2 downto 0);  -- Selector de 3 bits
    data_out: out std_logic_vector(3 downto 0)   -- Salida de 4 bits
  );
end mux_32bit_4out;

architecture Behavioral of mux_32bit_4out is
begin
  process(data_in, sel)
  begin
    case sel is
      when "111" => data_out <= data_in(3 downto 0);   -- Bits 0-3
      when "110" => data_out <= data_in(7 downto 4);   -- Bits 4-7
      when "101" => data_out <= data_in(11 downto 8);  -- Bits 8-11
      when "100" => data_out <= data_in(15 downto 12); -- Bits 12-15
      when "011" => data_out <= data_in(19 downto 16); -- Bits 16-19
      when "010" => data_out <= data_in(23 downto 20); -- Bits 20-23
      when "001" => data_out <= data_in(27 downto 24); -- Bits 24-27
      when "000" => data_out <= data_in(31 downto 28); -- Bits 28-31
      when others => data_out <= (others => '0');       -- Salida por defecto
    end case;
  end process;
end Behavioral;