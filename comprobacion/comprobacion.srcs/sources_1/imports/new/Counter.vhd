----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 16:22:56
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity contador_0_a_7 is
  port (
    clk   : in  std_logic;            -- Reloj
    count : out std_logic_vector(2 downto 0) -- Salida del contador
  );
end contador_0_a_7;

architecture Behavioral of contador_0_a_7 is
  signal counter: unsigned(2 downto 0) := (others => '0'); -- Señal interna del contador
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if counter = 7 then
        counter <= (others => '0'); -- Reinicia a 0 cuando llega a 3
      else
        counter <= counter + 1; -- Incrementa el contador
      end if;
    end if;
  end process;

  -- Asignar el valor de la señal interna del contador a la salida
  count <= std_logic_vector(counter);

end Behavioral;

