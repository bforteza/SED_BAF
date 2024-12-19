----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 17:33:22
-- Design Name: 
-- Module Name: ums_counter - Behavioral
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

entity ums_counter is
  generic (
    WIDTH: positive := 4 -- Ancho del contador (4 bits)
  );
  port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET  : in  std_logic;                          -- Reset asíncrono activo alto
    DATA_UMS     : inout std_logic_vector (WIDTH - 1 downto 0); -- Puerto de datos bidireccional
    CARRY_OUT_UMS    : out std_logic                           -- Señal de acarreo (overflow)
  );
end ums_counter;

architecture behavioral of ums_counter is
  signal q_i: unsigned(WIDTH - 1 downto 0) := (others => '0'); -- Contador interno
  signal data_internal: std_logic_vector(WIDTH - 1 downto 0);  -- Señal intermedia para manejar el puerto `inout`
begin
  -- Proceso principal del contador
  process (CLK, RESET)
  begin
    if RESET = '1' then
      -- Reset: Reinicia el contador a 0
      q_i <= (others => '0');
    elsif rising_edge(CLK) then
        if DATA_UMS /= "ZZZZ"  then
        -- Carga del valor desde el puerto `DATA` cuando no está en alta impedancia
        q_i <= unsigned(DATA_UMS);
      elsif q_i = 9 then
        -- Si el contador llega a 9, reinicia a 0
        q_i <= (others => '0');
      else
        -- Incrementa el contador
        q_i <= q_i + 1;
      end if;
    end if;
  end process;

  -- Asignación al puerto inout
  process (q_i,RESET)
  begin
    if RESET = '1' then
      data_internal <= (others => '0'); -- Reinicia la señal `DATA` durante el reset
    else
      data_internal <= std_logic_vector(q_i); -- Actualiza `DATA` con el valor del contador
    end if;
  end process;

DATA_UMS <= data_internal when RESET = '0' else (others => 'Z'); -- Control bidireccional del puerto
  CARRY_OUT_UMS <= '1' when q_i = 9 else '0'; -- Señal de acarreo (overflow) activa al alcanzar 9
end behavioral;
