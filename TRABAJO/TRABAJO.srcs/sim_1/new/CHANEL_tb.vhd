library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaración del testbench
entity CHANEL_tb is
end CHANEL_tb;

architecture Behavioral of CHANEL_tb is

  -- Se definen las señales para las entradas y salidas
  signal A_tb : std_logic_vector(3 downto 0);  -- Ajustado a WIDHT = 4
  signal B_tb : std_logic_vector(3 downto 0);  -- Ajustado a WIDHT = 4
  signal ENABLE_tb : std_logic;

  -- Se instancia la unidad bajo prueba (UUT)
  component CHANEL
    generic (
      WIDHT : positive := 4  -- Aseguramos que WIDHT es 4
    );
    port (
      A: inout std_logic_vector(WIDHT-1 downto 0);
      B: inout std_logic_vector(WIDHT-1 downto 0);
      ENABLE : in std_logic
    );
  end component;

begin

  -- Instanciación de la UUT (unidad bajo prueba)
  uut: CHANEL
    port map (
      A => A_tb,
      B => B_tb,
      ENABLE => ENABLE_tb
    );

  -- Bloque de simulación
  stim_proc: process
  begin
    -- Inicialización de señales
    A_tb <= "ZZZZ";  -- Estado de alta impedancia
    B_tb <= "ZZZZ";  -- Estado de alta impedancia
    ENABLE_tb <= '0';
    wait for 10 ns;

    -- Prueba 1: ENABLE = '0', A y B deberían estar en alta impedancia
    ENABLE_tb <= '1';
    wait for 10 ns;

    -- Prueba 2: ENABLE = '1', A y B deberían ser iguales
    A_tb <= "1010";
    wait for 10 ns;

    -- Prueba 3: Cambiar A, B debería seguir a A
    A_tb <= "ZZZZ";
    wait for 10 ns;

    -- Prueba 4: Cambiar B, A debería seguir a B
    B_tb <= "0011";
    wait for 10 ns;

    -- Prueba 5: Cambiar ENABLE a '0', A y B deberían estar en alta impedancia
    ENABLE_tb <= '0';
    wait for 10 ns;

    -- Termina la simulación
    assert false report "Simulación terminada" severity failure;
    wait;
  end process;

end Behavioral;
