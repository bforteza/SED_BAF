library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Test Bench Entity
entity tb_TOP is
end tb_TOP;

architecture TB of tb_TOP is

  -- Component Declaration for the TOP entity
  component TOP
    port (
      IO_BCD      : inout std_logic_vector(31 downto 0);
      CLK         : in std_logic;
      RESET       : in std_logic;
      START_STOP  : in std_logic;
      I_U         : in std_logic;
      I_L         : in std_logic;
      I_R         : in std_logic;
      I_D         : in std_logic
    );
  end component;

  -- Signals for Stimuli
  signal IO_BCD      : std_logic_vector(31 downto 0) := (others => 'Z');
  signal CLK         : std_logic := '0';
  signal RESET       : std_logic := '0';
  signal START_STOP  : std_logic := '0';
  signal I_U         : std_logic := '0';
  signal I_L         : std_logic := '0';
  signal I_R         : std_logic := '0';
  signal I_D         : std_logic := '0';

  -- Clock Period
  constant CLK_PERIOD : time := 10 ns;

begin
  -- Instantiate the TOP component
  uut: TOP
    port map (
      IO_BCD     => IO_BCD,
      CLK        => CLK,
      RESET      => RESET,
      START_STOP => START_STOP,
      I_U        => I_U,
      I_L        => I_L,
      I_R        => I_R,
      I_D        => I_D
    );

  -- Clock Process
  CLK_PROCESS: process
  begin
    while true loop
      CLK <= '0';
      wait for CLK_PERIOD / 2;
      CLK <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
  end process;

  -- Stimulus Process
  STIMULUS_PROCESS: process
  begin
    -- Initial Reset
    RESET <= '1';
    wait for 20 ns;
    RESET <= '0';
    wait for 20 ns;

    IO_BCD <= "00000000000000000000000000000000";
    wait for 20 ns;
    
  
    START_STOP <= '1';
    wait for 2000 ns;
    START_STOP <= '0';
    wait for 1000 ns;
    IO_BCD <= (others => 'Z');
    

    -- Input Up
    I_U <= '1';
    wait for 800 ns;
    I_U <= '0';

    -- Input Left
    I_L <= '1';
    wait for 800 ns;
    I_L <= '0';

    -- Input Right
    I_R <= '1';
    wait for 800 ns;
    I_R <= '0';

    -- Input Down
    I_D <= '1';
    wait for 800 ns;
    I_D <= '0';

    -- Observe Output for a Few Clock Cycles
    wait;
  end process;

end TB;
