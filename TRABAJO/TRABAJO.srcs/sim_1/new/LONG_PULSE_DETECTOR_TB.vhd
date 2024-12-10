library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LONG_PULSE_DETECTOR_TB is
-- Testbench no tiene puertos
end LONG_PULSE_DETECTOR_TB;

architecture Behavioral of LONG_PULSE_DETECTOR_TB is
  -- Component Declaration
  component LONG_PULSE_DETECTOR is
    generic (
      REG_LENGTH : integer
    );
    port (
      CLK : in std_logic;
      SYNC_IN : in std_logic;
      EDGE : out std_logic
    );
  end component;

  -- Signals for testing
  signal CLK : std_logic := '0';
  signal SYNC_IN : std_logic := '0';
  signal EDGE : std_logic;

  -- Clock period
  constant CLK_PERIOD : time := 10 ns;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: LONG_PULSE_DETECTOR
    generic map (
      REG_LENGTH => 5 -- Puedes ajustar este valor para diferentes pruebas
    )
    port map (
      CLK => CLK,
      SYNC_IN => SYNC_IN,
      EDGE => EDGE
    );

  -- Clock generation
  clk_process : process
  begin
    while true loop
      CLK <= '0';
      wait for CLK_PERIOD / 2;
      CLK <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
  end process;

  -- Stimulus process
  stimulus_process : process
  begin
    -- Inicialización
    SYNC_IN <= '0';
    wait for 5 * CLK_PERIOD;

    -- Introducir un pulso largo
    for i in 1 to 5 loop
      SYNC_IN <= '1';
      wait for CLK_PERIOD;
    end loop;

    -- Regresar a bajo
    SYNC_IN <= '0';
    wait for 5 * CLK_PERIOD;

    -- Fin de simulación
    wait;
  end process;

end Behavioral;
