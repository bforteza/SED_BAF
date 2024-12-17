----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 17:19:34
-- Design Name: 
-- Module Name: fdivider - Behavioral
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

entity fdivider is
  generic (
    CLK_FREQ : positive := 100000000 -- Frecuencia del reloj en Hz (por defecto 100 MHz)
  );
  port (
    RESET  : in  std_logic; -- Señal de reset
    CLK    : in  std_logic; -- Reloj
    CE_IN  : in  std_logic := '1'; -- Habilitación de entrada
    CE_OUT : out std_logic  -- Señal de salida activa cada milisegundo
  );
end fdivider;

architecture Behavioral of fdivider is
 
 -- Cálculo del número de ciclos por milisegundo
  constant CYCLES_PER_MS: integer := CLK_FREQ / 1000;

  -- Subtipo y señal para el contador
  subtype count_range is integer range 0 to CYCLES_PER_MS - 1;
  signal count: count_range := CYCLES_PER_MS - 1;
  signal ce_out_reg : std_logic := '0'; -- Señal interna para mantener el estado de CE_OUT
begin
  process (RESET, CLK)
  begin
    if RESET = '1' then
      -- Reset: Reinicia el contador y desactiva CE_OUT
      count <= CYCLES_PER_MS - 1;
      ce_out_reg <= '0';
    elsif rising_edge(CLK) then
      if CE_IN = '1' then
        if count = 0 then
          -- Se activa CE_OUT durante un ciclo
          ce_out_reg <= '1';
          count <= CYCLES_PER_MS - 1; -- Reinicia el contador
        else
        ce_out_reg <= '0';
          -- Decrementa el contador normalmente
          count <= count - 1; 
        end if;
      end if;
    end if;
  end process;

  -- Asignar el valor de la señal interna al puerto de salida CE_OUT
  CE_OUT <= ce_out_reg;
 
end Behavioral;
