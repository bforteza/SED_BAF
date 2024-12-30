
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
  generic (
    SIZE: positive := 4                               -- Asignación del genérico SIZE a 4
  );
  port (
    CLK      : in  std_logic;                         -- Señal de reloj
    RESET  : in  std_logic;                           -- Reset asíncrono activo alto
    C_IN   : in  std_logic;                           -- Señal de acarreo (overflow) del anterior contador/divisor de frecuencia
    DATA   : inout std_logic_vector(3 downto 0);      -- Puerto de datos bidireccional para el  contador
    C_OUT : out std_logic;                            -- Señal de acarreo generada 
    LOAD : in std_logic                           
  );
end counter;

architecture Behavioral of counter is

  signal F_C_IN : std_logic := '0';             --Señal que controla los datos
  signal aux : unsigned(3 downto 0) := "0000";  --Señal auxiliar para la asignación de DATA

begin
  -- Proceso principal del segundo contador
  process (CLK, RESET)
  begin
    if RESET = '1' then     --Reset de datos
      aux <= "0000";
      F_C_IN <= '0';        --Reinicia la señal de control
    elsif rising_edge(CLK) then
      if LOAD = '1' then
        -- Leer los datos en modo entrada
        aux <= unsigned(DATA);
        F_C_IN <= '0'; -- Reinicia la señal de control
      else
        -- Contador principal
        if (C_IN = '1' AND F_C_IN = '0') then
          F_C_IN <= '1';
          if aux = SIZE then
            aux <= "0000";
          else
            aux <= aux + 1;
          end if;
        elsif C_IN = '0' then
          F_C_IN <= '0';
        end if;
      end if;
    end if;
  end process;

  C_OUT <= C_IN WHEN aux = SIZE else '0';   --Generación de señal de acarreo de salida
  DATA <= std_logic_vector(aux) when LOAD = '0' else (others => 'Z');    -- Control de salida de DATA: solo escribir cuando LOAD = '0'

end Behavioral;
