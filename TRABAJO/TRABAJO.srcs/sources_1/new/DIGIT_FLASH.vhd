library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DIGIT_FLASH is
 Port ( 
    IO_BCDA : inout std_logic_vector(31 downto 0);
    IO_BCDB : inout std_logic_vector(31 downto 0);
    CLK     : in std_logic;
    ENABLE  : in std_logic;
    RESET   : in std_logic;
    B       : in std_logic_vector(2 downto 0)
    );
end DIGIT_FLASH;

architecture Behavioral of DIGIT_FLASH is

-- Componente DECODER
component DECODER 
generic(
    WIDHT : positive := 3);
  Port ( 
    S      : in  std_logic_vector (WIDHT-1 downto 0);
    O      : out std_logic_vector (2**WIDHT-1 downto 0);
    ENABLE : in std_logic
    );
end component;

-- Componente CHANEL
component CHANEL 
port (
    A      : inout  std_logic_vector (3 downto 0);
    B      : inout std_logic_vector (3 downto 0);
    ENABLE : in std_logic;
    D      : in std_logic   -- 0: A -> B, 1: B -> A
  );
end component;

-- Componente f_divider
component f_divider 
  generic (
    MODULE: positive := 16
  );
  port (
    RESET  : in  std_logic;
    CLK    : in  std_logic;
    CE_IN  : in  std_logic;
    CE_OUT : out std_logic
  );
end component;

-- Declaración de señales intermedias
signal ce_out_signal     : std_logic;                         -- Señal intermedia para CE_OUT
signal decoder_output    : std_logic_vector(7 downto 0);      -- Señal intermedia para O del DECODER
signal channel_enable    : std_logic_vector(7 downto 0);      -- Señal intermedia para habilitar canales

begin

-- Instancia del divisor de frecuencia
f_divider_inst: f_divider
    generic map ( 
      MODULE => 10)
    Port map( 
       RESET  => NOT ENABLE,           -- Conecta RESET
       CLK    => CLK,             -- Conecta CLK
       CE_IN  => ENABLE,          -- Habilitación del divisor
       CE_OUT => ce_out_signal    -- Conecta salida a señal intermedia
    );
        
-- Instancia del decodificador
decoder_inst: DECODER 
    generic map(
        WIDHT => 3)                -- Configura el decodificador para 3 bits de entrada
    Port map( 
        S      => B,               -- Conecta entrada seleccionada
        O      => decoder_output,  -- Conecta salida a señal intermedia
        ENABLE => ce_out_signal    -- Habilitación desde la señal intermedia
    );

-- Generación de canales usando señales intermedias
gen_chanel : for i in 0 to 7 generate
    -- Calcula la señal de habilitación de cada canal
    channel_enable(i) <= NOT (decoder_output(i)); 

    chanel_inst : CHANEL
   
    port map (
        A      => IO_BCDA(i*4+3 downto i*4),  -- Conecta segmento de 4 bits de IO_BCDA
        B      => IO_BCDB(i*4+3 downto i*4),  -- Conecta segmento de 4 bits de IO_BCDB
        ENABLE => channel_enable(i),          -- Conecta habilitación desde señal intermedia
        D      => ENABLE                      -- Dirección de transferencia
    );
end generate;

end Behavioral;
