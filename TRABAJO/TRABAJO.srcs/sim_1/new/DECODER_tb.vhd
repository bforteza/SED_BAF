library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DECODER_tb is
end DECODER_tb;

architecture Behavioral of DECODER_tb is
  -- Declaración de señales para conectar con la entidad DECODER
  constant WIDHT : positive := 3;  -- Tamaño de S, igual que en la entidad
  signal S_tb    : std_logic_vector(WIDHT-1 downto 0);
  signal O_tb    : std_logic_vector(2**WIDHT-1 downto 0);
  signal ENABLE_tb : std_logic;

  -- Instancia de la unidad bajo prueba (UUT)
  component DECODER
    generic(
      WIDHT : positive := 3
    );
    port (
      S : in  std_logic_vector(WIDHT-1 downto 0);
      O : inout std_logic_vector(2**WIDHT-1 downto 0);
      ENABLE : in std_logic
    );
  end component;

begin
  -- Instancia de la entidad DECODER
  uut: DECODER
    generic map (
      WIDHT => WIDHT
    )
    port map (
      S => S_tb,
      O => O_tb,
      ENABLE => ENABLE_tb
    );

  -- Proceso de prueba
  stim_proc: process
  begin
    -- Inicialización de señales
    ENABLE_tb <= '0';
    S_tb <= (others => '0');
    wait for 10 ns;

    -- Prueba 1: ENABLE = '0', O debería estar en alta impedancia
    ENABLE_tb <= '0';
    S_tb <= "000";
    wait for 10 ns;
    assert (O_tb = (O_tb'range => 'Z')) report "Fallo en Prueba 1: O no está en alta impedancia cuando ENABLE=0" severity error;

    -- Prueba 2: ENABLE = '1', S = "000", O(0) debe estar activo
    ENABLE_tb <= '1';
    S_tb <= "000";
    wait for 10 ns;
    assert (O_tb = "00000001") report "Fallo en Prueba 2: O(0) no está activo" severity error;

    -- Prueba 3: ENABLE = '1', S = "001", O(1) debe estar activo
    S_tb <= "001";
    wait for 10 ns;
    assert (O_tb = "00000010") report "Fallo en Prueba 3: O(1) no está activo" severity error;

    -- Prueba 4: ENABLE = '1', S = "010", O(2) debe estar activo
    S_tb <= "010";
    wait for 10 ns;
    assert (O_tb = "00000100") report "Fallo en Prueba 4: O(2) no está activo" severity error;

    -- Prueba 5: ENABLE = '1', S = "011", O(3) debe estar activo
    S_tb <= "011";
    wait for 10 ns;
    assert (O_tb = "00001000") report "Fallo en Prueba 5: O(3) no está activo" severity error;

    -- Prueba 6: ENABLE = '1', S = "100", O(4) debe estar activo
    S_tb <= "100";
    wait for 10 ns;
    assert (O_tb = "00010000") report "Fallo en Prueba 6: O(4) no está activo" severity error;

    -- Prueba 7: ENABLE = '1', S = "101", O(5) debe estar activo
    S_tb <= "101";
    wait for 10 ns;
    assert (O_tb = "00100000") report "Fallo en Prueba 7: O(5) no está activo" severity error;

    -- Prueba 8: ENABLE = '1', S = "110", O(6) debe estar activo
    S_tb <= "110";
    wait for 10 ns;
    assert (O_tb = "01000000") report "Fallo en Prueba 8: O(6) no está activo" severity error;

    -- Prueba 9: ENABLE = '1', S = "111", O(7) debe estar activo
    S_tb <= "111";
    wait for 10 ns;
    assert (O_tb = "10000000") report "Fallo en Prueba 9: O(7) no está activo" severity error;

    -- Prueba 10: ENABLE = '0', O debería volver a alta impedancia
    ENABLE_tb <= '0';
    wait for 10 ns;
    assert (O_tb = (O_tb'range => 'Z')) report "Fallo en Prueba 10: O no está en alta impedancia cuando ENABLE=0" severity error;

    -- Finaliza la simulación
    assert false report "Simulación terminada" severity failure;
    wait;
  end process;

end Behavioral;
