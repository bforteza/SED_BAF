----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 18:04:04
-- Design Name: 
-- Module Name: tb_hour_counter - Behavioral
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

entity tb_hour_counter is
-- Testbench no tiene puertos
end tb_hour_counter;

architecture behavior of tb_hour_counter is

  -- Component declaration of the device under test (DUT)
  component hour_counter is
    generic (
      SIZE: positive := 24 -- Ancho de los contadores (máximo 4 bits para un contador decimal)
    );
    port (
      CLK      : in  std_logic;                          -- Señal de reloj
      RESET    : in  std_logic;                          -- Reset asíncrono activo alto
      C_IN     : in  std_logic;                          -- Señal de acarreo (overflow)
      DATA     : inout std_logic_vector(7 downto 0);     -- Puerto de datos bidireccional para el segundo contado
      LOAD     : in  std_logic                           -- Señal de carga
    );
  end component;

  -- Testbench signals
  signal CLK      : std_logic := '0';                       -- Señal de reloj
  signal RESET    : std_logic := '0';                       -- Señal de reset
  signal C_IN     : std_logic := '0';                       -- Señal de acarreo
  signal DATA     : std_logic_vector(7 downto 0) := (others => '0'); -- Datos del contador
  signal LOAD     : std_logic := '0';                       -- Señal de carga

  -- Clock generation
  constant CLK_PERIOD : time := 10 ns;

begin

  -- Instanciar el DUT (Dispositivo bajo prueba)
  uut: hour_counter
    generic map (SIZE => 24)
    port map (
      CLK => CLK,
      RESET => RESET,
      C_IN => C_IN,
      DATA => DATA,
      LOAD => LOAD
    );

  -- Clock process
  clock_process : process
  begin
    CLK <= '0';
    wait for CLK_PERIOD / 2;
    CLK <= '1';
    wait for CLK_PERIOD / 2;
  end process;

  -- Stimulus process
  stimulus_process : process
  begin
    -- Reset inicial
    RESET <= '1';
    wait for 20 ns;
    RESET <= '0';
    wait for 20 ns;

    -- Cargar valor al contador (Ejemplo: cargar 15)
    LOAD <= '1';
    DATA <= "00001111";  -- Cargar el valor 15
    wait for 20 ns;
    LOAD <= '0';
    DATA <= "ZZZZZZZZ" ; -- Release the DATA bus
    wait for 20 ns;
    -- Activar la señal de acarreo
    C_IN <= '1';
    wait for 10 ns;

    -- Probar la cuenta
    C_IN <= '0';
    wait for 200 ns;

    -- Activar el acarreo nuevamente para ver si vuelve a 0
    C_IN <= '1';
    wait for 20 ns;

    -- Test de contador desde 0 hasta 23, luego reiniciar a 0
    wait for 250 ns;

    -- Fin de la simulación
    assert false report "Simulación terminada" severity failure;

  end process;

end behavior;