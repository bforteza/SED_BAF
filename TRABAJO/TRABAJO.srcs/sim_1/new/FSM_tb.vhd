library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_tb is
-- Testbench no tiene puertos
end FSM_tb;

architecture Behavioral of FSM_tb is

  -- Component declaration for the Unit Under Test (UUT)
  component FSM
    Port (
      CLK : in std_logic;
      RESET : in std_logic;
      I_L : in std_logic;
      I_R : in std_logic;
      S : out std_logic_vector(2 downto 0);
      START_STOP : in std_logic;
      ENABLE : out std_logic
    );
  end component;

  -- Signals to connect to the UUT
  signal CLK : std_logic := '0';
  signal RESET : std_logic := '0';
  signal I_L : std_logic := '0';
  signal I_R : std_logic := '0';
  signal S : std_logic_vector(2 downto 0);
  signal START_STOP : std_logic := '0';
  signal ENABLE : std_logic;

  -- Clock period definition
  constant CLK_PERIOD : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: FSM
    Port map (
      CLK => CLK,
      RESET => RESET,
      I_L => I_L,
      I_R => I_R,
      S => S,
      START_STOP => START_STOP,
      ENABLE => ENABLE
    );

  -- Clock generation process
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
    -- Initialize inputs
    RESET <= '1';
    I_L <= '0';
    I_R <= '0';
    START_STOP <= '0';
    wait for 2 * CLK_PERIOD;

    -- Release RESET and activate FSM
    RESET <= '0';
    START_STOP <= '1';
    wait for  CLK_PERIOD;
    START_STOP <= '0';
    wait for CLK_PERIOD;
    
    assert ENABLE = '1' report "Fallo: FSM no está activa tras Start_Stop." severity error;
    assert S = "100" report "Fallo: No empieza en el bit indicado" severity error;
    -- Test left selection
    I_L <= '1';
    wait for  CLK_PERIOD;
    assert S = "101" report "Fallo: No selecciona correctamente al mover izquierda (1)." severity error;

    wait for 2 * CLK_PERIOD;
    I_L <= '0';

    -- Test right selection
    I_R <= '1';
    wait for 3 * CLK_PERIOD;
    assert S = "100" report "Fallo: No selecciona correctamente al mover derecha (1)." severity error;

    I_R <= '0';
    wait for 2 * CLK_PERIOD;

    -- Deactivate FSM
    START_STOP <= '1';
    wait for  CLK_PERIOD;
    START_STOP <= '0';
    wait for CLK_PERIOD;
    assert ENABLE = '0' report "Fallo: FSM sigue activa tras desactivar Start_Stop." severity error;

    -- Test no change when inactive
    I_L <= '1';
    wait for 2 * CLK_PERIOD;
    assert S = "100" report "Fallo: Cambia de selección cuando está inactiva." severity error;

    I_L <= '0';
    I_R <= '1';
    wait for 2 * CLK_PERIOD;
    assert S = "100" report "Fallo: Cambia de selección cuando está inactiva." severity error;

    I_R <= '1';
    START_STOP <= '1';
    wait for CLK_PERIOD;
    START_STOP <= '0';
    wait;
    end process;
    
end Behavioral;
