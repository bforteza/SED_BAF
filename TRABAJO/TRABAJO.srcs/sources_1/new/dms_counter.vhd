
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dms_counter is
  generic (
    SIZE: positive := 4 -- Ancho de los contadores (máximo 4 bits para un contador decimal)
  );
  port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET  : in  std_logic;                          -- Reset asíncrono activo alto
    C_IN   : in  std_logic;                           -- Señal de acarreo (overflow) del primer contador
    DATA   : inout std_logic_vector(WIDTH - 1 downto 0); -- Puerto de datos bidireccional para el segundo contador
    C_OUT : out std_logic; -- Señal de acarreo (overflow) del segundo contador
    LOAD : in std_logic                           
  );
end dms_counter;

architecture Behavioral of dms_counter is
    
  signal data_internal_2: std_logic_vector(3 downto 0);  -- Señal intermedia para manejar el puerto `inout`
begin
     -- Proceso principal del segundo contador
  process (CLK, RESET)
  variable aux: unsigned(3 downto 0) := (others => '0');
  begin
    if RESET = '1' then
      -- Reset: Reinicia el contador a 0
      aux := (others => '0');
    elsif rising_edge(CLK) then
     if LOAD = '1'  then
        DATA_DMS <= (OTHERS => 'Z');
        -- Carga del valor desde el puerto `DATA` cuando no está en alta impedancia
        aux := unsigned(DATA_DMS);
      elsif LOAD = '0' then
        if C_IN = '1' then 
            if aux = SIZE then
                aux := "0000";
                C_OUT <= '1';
            else
                aux := aux + 1;
                C_OUT <= '0';
            end if; 
            
        end if;
        DATA <= aux; 
      end if;
    end if;
  end process;



end Behavioral;
