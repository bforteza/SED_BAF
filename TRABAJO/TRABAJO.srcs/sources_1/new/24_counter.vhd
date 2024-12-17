----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 17:44:05
-- Design Name: 
-- Module Name: 24_counter - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Contador de horas (0-23) gobernado por una señal de acarreo
entity hour_counter is
    generic (
    SIZE: positive := 24 -- Ancho de los contadores (máximo 4 bits para un contador decimal)
  );
    port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET  : in  std_logic;                          -- Reset asíncrono activo alto
    C_IN   : in  std_logic;                           -- Señal de acarreo (overflow) del primer contador
    DATA   : inout std_logic_vector(7 downto 0); -- Puerto de datos bidireccional para el segundo contador
    LOAD : in std_logic
    ); 
end hour_counter;

architecture behavioral of hour_counter is
begin
    process (CLK, RESET)
 variable aux: unsigned(7 downto 0) := (others => '0'); 
  begin
    if RESET = '1' then
      -- Reset: Reinicia el contador a 0
      aux := (others => '0');    
    elsif rising_edge(CLK) then
     if LOAD = '1'  then
        DATA <= (OTHERS => 'Z');
        -- Carga del valor desde el puerto `DATA` cuando no está en alta impedancia
        aux := unsigned(DATA);
      elsif LOAD = '0' then
        if C_IN = '1' then 
            if aux = SIZE -1 then
                aux := "00000000";
            else
                aux := aux + 1;
            end if; 
            
        end if;
        
        DATA <= std_logic_vector(aux); 
      end if;
    end if;
  end process;
 
end behavioral;