----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2024 12:02:48
-- Design Name: 
-- Module Name: tb_top_timer - Behavioral
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

entity tb_top_timer is
end tb_top_timer;

architecture Behavioral of tb_top_timer is

  -- Señales del testbench
  signal CLK_tb     : std_logic := '0';
  signal RESET_tb   : std_logic := '0';
  signal CE_IN_tb   : std_logic := '1';
  signal LOAD_tb    : std_logic := '0';
  signal DATA_tb    : std_logic_vector(31 downto 0) := (others => 'Z');

  -- Instancia de la entidad a probar
  component top_timer
    port (
      CLK    : in  std_logic;
      RESET  : in  std_logic;
      CE_IN  : in  std_logic;
      LOAD   : in  std_logic;
      DATA   : inout std_logic_vector (31 downto 0)
    );
  end component;

  -- Constantes de simulación
  constant CLK_PERIOD : time := 10 ns;  -- Periodo del reloj (100 MHz)

begin

  -- Instancia del diseño bajo prueba (DUT)
  DUT: top_timer
    port map (
      CLK   => CLK_tb,
      RESET => RESET_tb,
      CE_IN => CE_IN_tb,
      LOAD  => LOAD_tb,
      DATA  => DATA_tb
    );

  -- Generación de la señal de reloj
  process
  begin
    while now < 1 ms loop  -- Simulación durante 1 ms
      CLK_tb <= not CLK_tb;
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- Proceso de estímulos
  process
  begin
    -- Inicialización
    report "Starting simulation...";
    RESET_tb <= '1';  -- Reset activo
    LOAD_tb  <= '0';
    DATA_tb  <= (others => 'Z');  -- Alta impedancia en DATA
    wait for 20 ns;

    RESET_tb <= '0';  -- Desactiva reset
    wait for 20 ns;

    -- Simulación de carga de datos (LOAD = '1')
    report "Loading data into the counter...";
    LOAD_tb <= '1';
    DATA_tb <= x"12345678";  -- Cargar un valor en DATA
    wait for 2*CLK_PERIOD;

    LOAD_tb <= '0';  -- LOAD desactivado
    DATA_tb <= (others => 'Z');  -- Alta impedancia
    wait for 4*CLK_PERIOD;

   

    -- Finalización
    report "End of simulation.";
    wait;
  end process;

end Behavioral;