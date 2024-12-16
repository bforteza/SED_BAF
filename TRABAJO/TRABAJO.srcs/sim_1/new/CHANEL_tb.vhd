library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaración del testbench
entity CHANEL_tb is
end CHANEL_tb;

architecture Behavioral of CHANEL_tb is

  -- Señales de prueba para los puertos de la entidad CHANEL
  signal A_tb, B_tb : std_logic_vector(3 downto 0);  -- Ajustado a WIDHT = 4
  signal ENABLE_tb : std_logic;
  signal D_tb : std_logic;

  -- Instancia de la unidad bajo prueba (UUT)
  component CHANEL
    generic (
      WIDHT : positive := 4  -- Definición de ancho
    );
    port (
      A: inout std_logic_vector(WIDHT-1 downto 0);
      B: inout std_logic_vector(WIDHT-1 downto 0);
      ENABLE : in std_logic;
      D : in std_logic
    );
  end component;

begin

  -- Instanciación de la UUT
  uut: CHANEL
    port map (
      A => A_tb,
      B => B_tb,
      ENABLE => ENABLE_tb,
      D => D_tb
    );

  -- Proceso de estimulación
  stim_proc: process
  begin
    -- Inicialización de señales
    A_tb <= (others => 'Z');
    B_tb <= (others => 'Z');
    ENABLE_tb <= '0';
    D_tb <= '0';
    wait for 10 ns;

    -- Prueba 1: ENABLE = '0', D = '0'
    -- A y B deben permanecer en alta impedancia
    ENABLE_tb <= '0';
    D_tb <= '0';
    A_tb <= "1010";
    B_tb <= "1100";
    wait for 10 ns;
    assert ( A_tb = "1010" and B_tb = "1100") report "Fallo prueba 1: no son independientes" severity error;
    -- Prueba 2: ENABLE = '1', D = '0'
    -- B debe seguir el valor de A
    ENABLE_tb <= '1';
    D_tb <= '0';
    A_tb <= "1111";
    B_tb <= "ZZZZ";
    wait for 10 ns;
    assert (B_tb = "1111") report "Fallo en Prueba 2: B no sigue a A cuando ENABLE=1 y D=0" severity error;

    -- Prueba 3: Cambia A, B debe seguir el nuevo valor de A
    A_tb <= "0011";
    wait for 10 ns;
    assert (B_tb = "0011") report "Fallo en Prueba 3: B no sigue el cambio en A" severity error;

    -- Prueba 4: ENABLE = '1', D = '1'
    -- A debe seguir el valor de B
    ENABLE_tb <= '1';
    D_tb <= '1';
    B_tb <= "0101";
    A_tb <= "ZZZZ";
    wait for 10 ns;
    assert (A_tb = "0101") report "Fallo en Prueba 4: A no sigue a B cuando ENABLE=1 y D=1" severity error;

    -- Prueba 5: Cambia B, A debe seguir el nuevo valor de B
    B_tb <= "1001";
    wait for 10 ns;
    assert (A_tb = "1001") report "Fallo en Prueba 5: A no sigue el cambio en B" severity error;

    -- Prueba 6: ENABLE = '0' (ambas señales en alta impedancia)
    ENABLE_tb <= '0';
    wait for 10 ns;
    assert (A_tb = "ZZZZ") report "Fallo en Prueba 6: A y B no están en alta impedancia cuando ENABLE=0" severity error;

    -- Termina la simulación
    assert false report "Simulación terminada" severity failure;
    wait;
  end process;

end Behavioral;
