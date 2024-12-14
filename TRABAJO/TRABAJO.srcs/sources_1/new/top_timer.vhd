----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 17:31:49
-- Design Name: 
-- Module Name: top_timer - Behavioral
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

entity top_timer is
  generic (
    WIDTH: positive := 4 -- Ancho de los contadores (4 bits)
  );
  port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET    : in  std_logic;                          -- Reset asíncrono activo alto
    DATA_UMS : inout std_logic_vector(WIDTH - 1 downto 0); -- Puerto de datos bidireccional para el primer contador
    DATA_DMS : inout std_logic_vector(WIDTH - 1 downto 0); -- Puerto de datos bidireccional para el segundo contador
    CARRY_UMS : out std_logic;                          -- Señal de acarreo (overflow) del primer contador
    CARRY_DMS : out std_logic;                           -- Señal de acarreo (overflow) del segundo contador
     CE_OUT    : out std_logic                             -- Señal de salida activa del divisor de frecuencia
  );
end top_timer;

architecture Behavioral of top_timer is

-- Instanciación del divisor de frecuencia (fdivider)
  component fdivider is
    generic (
      CLK_FREQ : positive := 50000000 -- Frecuencia del reloj (por defecto 50 MHz)
    );
    port (
      RESET  : in  std_logic;
      CLK    : in  std_logic;
      CE_IN  : in  std_logic;
      CE_OUT : out std_logic
    );
  end component;

  -- Instanciación del primer contador (ums_counter)
  component ums_counter is
    generic (
      WIDTH: positive := 4
    );
    port (
      CLK      : in  std_logic;
      RESET    : in  std_logic;
      DATA_UMS : inout std_logic_vector(WIDTH - 1 downto 0);
      CARRY_OUT_UMS : out std_logic
    );
  end component;

  -- Instanciación del segundo contador (dms_counter)
  component dms_counter is
    generic (
      WIDTH: positive := 4
    );
    port (
      CLK      : in  std_logic;
      RESET    : in  std_logic;
      CARRY_IN_DMS : in  std_logic;
      DATA_DMS : inout std_logic_vector(WIDTH - 1 downto 0);
      CARRY_OUT_DMS : out std_logic
    );
  end component;

  -- Señales internas para conectar los contadores
  signal internal_data_ums : std_logic_vector(WIDTH - 1 downto 0);
  signal internal_data_dms : std_logic_vector(WIDTH - 1 downto 0);
  signal ce_out_internal : std_logic;


begin

-- Instancia del divisor de frecuencia (fdivider)
  fdivider_inst : fdivider
    generic map (
      CLK_FREQ => 50000000  -- Ajusta la frecuencia de reloj
    )
    port map (
      RESET  => RESET,
      CLK    => CLK,
      CE_IN  => '1',         -- Habilitar el divisor de frecuencia permanentemente
      CE_OUT => ce_out_internal
    );

  -- Instancia del primer contador (ums_counter)
  ums_counter_inst : ums_counter
    generic map (
      WIDTH => WIDTH
    )
    port map (
      CLK      => CLK,
      RESET    => RESET,
      DATA_UMS => internal_data_ums,  -- Se conecta el puerto de datos bidireccionales
      CARRY_OUT_UMS => CARRY_UMS
    );

  -- Instancia del segundo contador (dms_counter)
  dms_counter_inst : dms_counter
    generic map (
      WIDTH => WIDTH
    )
    port map (
      CLK      => CLK,
      RESET    => RESET,
      CARRY_IN_DMS => CARRY_OUT_UMS,         -- Conectamos el acarreo del primer contador
      DATA_DMS => internal_data_dms,  -- Se conecta el puerto de datos bidireccionales
      CARRY_OUT_DMS => CARRY_DMS
    );

process (RESET, ce_out_internal)
  begin
    if RESET = '1' then
      CE_OUT <= '0';  -- En reset, no se activa el contador
    else
      CE_OUT <= ce_out_internal;  -- Cuando el divisor genera el pulso, se pasa al puerto CE_OUT
    end if;
  end process;

  -- Asignación del puerto bidireccional `DATA_UMS`
  DATA_UMS <= internal_data_ums when RESET = '0' else (others => 'Z');  -- Control de alta impedancia en reset
  DATA_DMS <= internal_data_dms when RESET = '0' else (others => 'Z');  -- Control de alta impedancia en reset

end Behavioral;