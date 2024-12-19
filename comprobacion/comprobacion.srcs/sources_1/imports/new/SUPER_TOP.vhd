

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SUPER_TOP is
  Port ( 
  
  CLK : in std_logic;
  RESET: in std_logic;
  START_STOP: in std_logic;
  I_U : in std_logic;
  I_L : in std_logic;
  I_R : in std_logic;
  I_D : in std_logic;

  seg     : out std_logic_vector(6 downto 0);  -- Salida al display de 7 segmentos
  AN      : out std_logic_vector(7 downto 0)   -- Salidas de activación de los display
  );
end SUPER_TOP;

architecture Behavioral of SUPER_TOP is
signal data : std_logic_vector(31 downto 0) :="00000000000000000000000000000000";
signal LOAD : std_logic := '0';
begin
U1: entity work.TOP
  Port map (
    IO_BCD => data, -- Conectar aquí si es necesario
    CLK => CLK,
    RESET => not RESET,
    START_STOP => START_STOP,
    I_U => I_U,
    I_L => I_L,
    I_R => I_R,
    I_D => I_D,
    LOAD => LOAD
  );

U2: entity work.TOP_display
  Port map (
    CLK => CLK,
    data_in => data, -- Cambiar si se necesita un origen de datos específico
    seg => seg,
    AN => AN
  );
U3: entity work.top_timer
    Port map (
    CLK   => CLK,                           -- Señal de reloj
    RESET => not RESET,                         -- Reset asíncrono activo alto  
    LOAD => LOAD,                               -- Señal de entradad de datos
    DATA => data
    );
end Behavioral;
