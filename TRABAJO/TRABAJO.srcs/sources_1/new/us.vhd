----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 12:06:41
-- Design Name: 
-- Module Name: us_counter - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hms_counter is
  generic (
    WIDTH: positive := 4 -- Ancho de los contadores (máximo 4 bits para un contador decimal)
  );
  port (
    CLK           : in  std_logic;                          -- Señal de reloj
    RESET         : in  std_logic;                          -- Reset asíncrono activo alto
    CARRY_IN_US  : in  std_logic;                          -- Señal de acarreo (overflow) del segundo contador
    DATA_US      : inout std_logic_vector(WIDTH - 1 downto 0); -- Puerto de datos bidireccional para el tercer contador
    CARRY_OUT_US : out std_logic                           -- Señal de acarreo (overflow) del tercer contador
  );
end hms_counter;

architecture Behavioral of hms_counter is
  signal q_i_3: unsigned(WIDTH - 1 downto 0) := (others => '0'); -- Contador interno para el tercer contador
  signal data_internal_3: std_logic_vector(WIDTH - 1 downto 0);  -- Señal intermedia para manejar el puerto `inout`
begin
  -- Proceso principal del tercer contador
  process (CLK, RESET)
  begin
    if RESET = '1' then
      -- Reset: Reinicia el contador a 0
      q_i_3 <= (others => '0');
    elsif rising_edge(CLK) then
      if DATA_US /= "ZZZZ" then
        -- Carga el valor desde el puerto `DATA` cuando no está en alta impedancia
        q_i_3 <= unsigned(DATA_US);
      elsif CARRY_IN_US = '1' then
        if q_i_3 = 9 then
          -- Si el contador llega a 9, reinicia a 0
          q_i_3 <= (others => '0');
        else
          -- Incrementa el contador
          q_i_3 <= q_i_3 + 1;
        end if;
      end if;
    end if;
  end process;

  -- Asignación al puerto inout
  process (q_i_3)
  begin
    if RESET = '1' then
      data_internal_3 <= (others => '0'); -- Reinicia la señal `DATA_HMS` durante el reset
    else
      data_internal_3 <= std_logic_vector(q_i_3); -- Actualiza `DATA_HMS` con el valor del tercer contador
    end if;
  end process;

  DATA_US <= data_internal_3 when RESET = '0' else (others => 'Z'); -- Control bidireccional del puerto
  CARRY_OUT_US <= '1' when q_i_3 = 9 else '0'; -- Señal de acarreo activa cuando se alcanza el valor máximo

end Behavioral;

