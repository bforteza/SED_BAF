----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 17:59:59
-- Design Name: 
-- Module Name: dms_counter - Behavioral
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




-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dms_counter is
  generic (
    WIDTH: positive := 4 -- Ancho de los contadores (máximo 4 bits para un contador decimal)
  );
  port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET  : in  std_logic;                          -- Reset asíncrono activo alto
    C_IN   : in  std_logic;                           -- Señal de acarreo (overflow) del primer contador
    DATA_DMS   : inout std_logic_vector(WIDTH - 1 downto 0); -- Puerto de datos bidireccional para el segundo contador
    C_OUT : out std_logic; -- Señal de acarreo (overflow) del segundo contador
    LOAD : in std_logic                           
  );
end dms_counter;

architecture Behavioral of dms_counter is
     signal q_i_2: unsigned(WIDTH - 1 downto 0) := (others => '0'); -- Contador interno para el segundo contador
  signal data_internal_2: std_logic_vector(3 downto 0);  -- Señal intermedia para manejar el puerto `inout`
begin
     -- Proceso principal del segundo contador
  process (CLK, RESET)
  begin
    if RESET = '1' then
      -- Reset: Reinicia el contador a 0
      q_i_2 <= (others => '0');
    elsif rising_edge(CLK) then
     if LOAD = '1'  then
        DATA_DMS <= (OTHERS => 'Z');
        -- Carga del valor desde el puerto `DATA` cuando no está en alta impedancia
        q_i_2 <= unsigned(DATA_DMS);
      elsif LOAD = '0' then
        if C_IN 
      end if;
    end if;
  end process;

  -- Asignación al puerto inout
  process (q_i_2)
  begin
    if RESET = '1' then
      data_internal_2 <= (others => '0'); -- Reinicia la señal `DATA_UMS_2` durante el reset
    else
      data_internal_2 <= std_logic_vector(q_i_2); -- Actualiza `DATA_UMS_2` con el valor del segundo contador
    end if;
  end process;

  DATA_DMS <= data_internal_2 when RESET = '0' else (others => 'Z'); -- Control bidireccional del puerto
  CARRY_OUT_DMS <= '1' when q_i_2 = 9 else '0'; -- Señal de acarreo activa cuando se alcanza el valor máximo

end Behavioral;
