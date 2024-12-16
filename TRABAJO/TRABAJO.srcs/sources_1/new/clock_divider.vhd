----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 13:53:19
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

entity clock_divider is
  port (
    clk_in  : in  std_logic;  -- Reloj de entrada
    clk_out : out std_logic   -- Reloj de salida dividido
  );
end clock_divider;

architecture Behavioral of clock_divider is
  signal counter : std_logic := '0';
begin
  process(clk_in)
  begin
    if rising_edge(clk_in) then
      counter <= not counter;  -- Alterna el valor del bit
    end if;
  end process;

  clk_out <= counter;  -- clk_out es la mitad de clk_in
end Behavioral;
