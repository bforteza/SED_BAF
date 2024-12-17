
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
  generic (
    SIZE: positive := 4 -- Ancho de los contadores (máximo 4 bits para un contador decimal)
  );
  port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET  : in  std_logic;                          -- Reset asíncrono activo alto
    C_IN   : in  std_logic;                           -- Señal de acarreo (overflow) del primer contador
    DATA   : inout std_logic_vector(3 downto 0); -- Puerto de datos bidireccional para el segundo contador
    C_OUT : out std_logic; -- Señal de acarreo (overflow) del segundo contador
    LOAD : in std_logic                           
  );
end counter;

architecture Behavioral of counter is
signal f_s : std_logic := '0';
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
        DATA <= (OTHERS => 'Z');
        -- Carga del valor desde el puerto `DATA` cuando no está en alta impedancia
        aux := unsigned(DATA);
      elsif LOAD = '0' then
        if C_IN = '1' then 
            if aux = SIZE - 1 then
                f_s <= '1';
            else 
                f_s <= '0';
            end if;
            
            if aux = SIZE then
                aux := "0000";
                
            else
                
                aux := aux + 1;
                
            end if; 
            
        end if;
        
      
        
        DATA <= std_logic_vector(aux); 
      end if;
    end if;
  end process;
  C_OUT <= '0' when f_s = '0' else C_IN when f_s = '1' ;
end Behavioral;
