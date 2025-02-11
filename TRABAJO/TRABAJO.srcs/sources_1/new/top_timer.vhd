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

signal data_i : std_logic_vector(31 downto 0);
signal c_fdivider: std_logic;
signal c_ums: std_logic;
signal c_dms: std_logic;
signal c_us: std_logic;
signal c_ds: std_logic;
signal c_umin: std_logic;
signal c_dmin: std_logic;

  component fdivider is
    generic (
      module : positive := 50000000 -- Frecuencia del reloj (por defecto 50 MHz)
    );
    port (
      RESET  : in  std_logic;
      CLK    : in  std_logic;
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
    C_IN   : in  std_logic;                           -- Señal de acarreo (overflow) del primer contador
    DATA   : inout std_logic_vector(3 downto 0); -- Puerto de datos bidireccional para el segundo contador
    C_OUT : out std_logic; -- Señal de acarreo (overflow) del segundo contador
    LOAD : in std_logic                           
  );
end component;

  component hour_counter is 
     generic (
    SIZE: positive := 24 -- Ancho de los contadores (máximo 4 bits para un contador decimal)
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

 



Inst_fdivider: fdivider 
  generic map (
      module => 1000000  -- Asignación del genérico SIZE a 8
    )
port map(
    CLK => CLK,
    RESET => RESET,
    CE_IN => '1',
    CE_OUT => c_fdivider
    );

Inst_counterums: counter 
     generic map (
      SIZE => 9  -- Asignación del genérico SIZE a 8
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_fdivider,
      DATA => DATA(3 downto 0),
      C_OUT => c_ums
      );
      
    Inst_counterdms: counter 
     generic map (
      SIZE => 9  -- Asignación del genérico SIZE a 8
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_ums,
      DATA => DATA(7 downto 4),
      C_OUT => c_dms
      );      
 
 Inst_counterus: counter 
     generic map (
      SIZE => 9  -- Asignación del genérico SIZE a 8
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_dms,
      DATA => DATA(11 downto 8),
      C_OUT => c_us
      );     
      
    Inst_counterds: counter 
     generic map (
      SIZE => 5  -- Asignación del genérico SIZE a 8
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_us,
      DATA => DATA(15 downto 12),
      C_OUT => c_ds
      );      
      
    Inst_counterumin: counter 
     generic map (
      SIZE => 9  -- Asignación del genérico SIZE a 8
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_ds,
      DATA => DATA(19 downto 16),
      C_OUT => c_umin
      );      
      
    Inst_counterdmin: counter 
     generic map (
      SIZE => 5  -- Asignación del genérico SIZE a 8
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_umin,
      DATA => DATA(23 downto 20),
      C_OUT => c_dmin
      );      
      
      Inst_hour_counter: hour_counter
     generic map (
      SIZE => 23 -- Asignación del genérico SIZE a 8
    )
    port map(
      CLK => CLK,
      RESET => RESET,
      LOAD => LOAD,
      C_IN => c_dmin,
      DATA => DATA(31 downto 24)
      );
      
      
end Behavioral;