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
use IEEE.numeric_std.all;

entity clock_divider is
  port (
    clk_in  : in  std_logic;   -- Reloj de entrada
    clk_out : out std_logic    -- Reloj de salida dividido
  );
end clock_divider;

architecture Behavioral of clock_divider is
  signal counter : integer := 0;      -- Contador para dividir la frecuencia
begin
  process(clk_in)
  begin
    if rising_edge(clk_in) then
      if counter = 100000 then  -- Ajusta este valor para cambiar la frecuencia de salida
        counter <= 0;            -- Reinicia el contador
        clk_out <= '1';  -- Invierte el reloj de salida
      else
        counter <= counter + 1;
        clk_out <= '0';   -- Incrementa el contador
      end if;
    end if;
  end process;
end Behavioral;

