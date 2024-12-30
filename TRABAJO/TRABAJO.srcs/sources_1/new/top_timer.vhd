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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_timer is
  port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET    : in  std_logic;                          -- Reset asíncrono activo alto
    LOAD     : in std_logic;                           -- Señal de entradad de datos
    DATA     : inout std_logic_vector (31 downto 0)    -- Datos bidireccionales
    );
end top_timer;

architecture Behavioral of top_timer is

signal c_fdivider: std_logic;   --Señales internas que gobiernan los acarreos
signal c_ums: std_logic;
signal c_dms: std_logic;
signal c_us: std_logic;
signal c_ds: std_logic;
signal c_umin: std_logic;
signal c_dmin: std_logic;

  component fdivider is
    generic (
      module : positive := 100000 -- Frecuencia del reloj 100 MHz
    );
    port (
      RESET  : in  std_logic;    -- Reset asíncrono activo alto
      CLK    : in  std_logic;    -- Señal de reloj
      CE_IN  : in  std_logic;
      CE_OUT : out std_logic
    );
  end component;

 component counter is 
    generic (
    SIZE: positive := 4 -- Ancho de los contadores (máximo 4 bits para un contador decimal)
  );
  port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET  : in  std_logic;                          -- Reset asíncrono activo alto
    C_IN   : in  std_logic;                           -- Señal de acarreo (overflow) del anterior contador
    DATA   : inout std_logic_vector(3 downto 0); -- Puerto de datos bidireccional para el contador
    C_OUT : out std_logic; -- Señal de acarreo (overflow) del contador
    LOAD : in std_logic                           
  );
end component;

  component hour_counter is 
     generic (
    SIZE: positive := 24 -- Ancho de los contadores (máximo 24 para un contador horario)
  );
  port (
    CLK      : in  std_logic;                          -- Señal de reloj
    RESET  : in  std_logic;                          -- Reset asíncrono activo alto
    C_IN   : in  std_logic;                           -- Señal de acarreo (overflow) del primer contador
    DATA   : inout std_logic_vector(7 downto 0); -- Puerto de datos bidireccional para el segundo contador
    LOAD : in std_logic  
    );  
end component;

begin

--Instanciaciones de los componentes

Inst_fdivider: fdivider  -- Divisor de frecuencia
  generic map (
      module => 100000  -- Asignación del genérico module a 100000
    )
port map(
    CLK => CLK,
    RESET => RESET,
    CE_IN => '1',
    CE_OUT => c_fdivider
    );

Inst_counterums: counter    --Contador para las unidades de milisegundo
     generic map (
      SIZE => 9  -- Asignación del genérico SIZE a 9
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_fdivider,       --La señal de acarreo entrante es la señal activa de salida del fdivider
      DATA => DATA(3 downto 0), --Asignación a los 4 últimos bits 
      C_OUT => c_ums            --Asignación a la señal interna de acarreo
      );
      
    Inst_counterdms: counter    -- Contador para las décimas de milisegundo
     generic map (
      SIZE => 9                 -- Asignación del genérico SIZE a 9
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_ums,            --Asignación correspondiente para el acarreo
      DATA => DATA(7 downto 4), --Asignación a los 4 bits siguientes
      C_OUT => c_dms            --Asignación correspondiente para el acarreo
      );      
 
 Inst_counterus: counter        --Contador para las unidades de segundo 
     generic map (
      SIZE => 9  -- Asignación del genérico SIZE a 9
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_dms,              --Asignación correspondiente para el acarreo
      DATA => DATA(11 downto 8),  --Asignación a los 4 bits siguientes
      C_OUT => c_us               --Asignación correspondiente para el acarreo
      );     
      
    Inst_counterds: counter     --Contador para las decenas de segundo
     generic map (
      SIZE => 5  -- Asignación del genérico SIZE a 5
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_us,                -- Asignación correspondiente para el acarreo
      DATA => DATA(15 downto 12),  --Asignación a los 4 bits siguientes
      C_OUT => c_ds                --Asignación correspondiente para el acarreo
      );      
      
    Inst_counterumin: counter   --Contador para las unidades de minuto
     generic map (
      SIZE => 9  -- Asignación del genérico SIZE a 9
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_ds,                 -- Asignación correspondiente para el acarreo
      DATA => DATA(19 downto 16),   --Asignación a los 4 bits siguientes
      C_OUT => c_umin               -- Asignación correspondiente para el acarreo
      );      
      
    Inst_counterdmin: counter   --Contador para las decenas de minuto
     generic map (
      SIZE => 5  -- Asignación del genérico SIZE a 5
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_umin,               -- Asignación correspondiente para el acarreo
      DATA => DATA(23 downto 20),   --Asignación a los 4 bits siguientes
      C_OUT => c_dmin               -- Asignación correspondiente para el acarreo
      );      
      
      Inst_hour_counter: hour_counter
     generic map (
      SIZE => 23 -- Asignación del genérico SIZE a 23
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_dmin,               -- Asignación correspondiente para el acarreo
      DATA => DATA(31 downto 24)    --Asignación a los 8 bits siguientes
      );
            
end Behavioral;
