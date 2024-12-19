
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TOP_DESPERTADOR_TB is
end TOP_DESPERTADOR_TB;

architecture Behavioral of TOP_DESPERTADOR_TB is

  -- Component Declaration for the Unit Under Test (UUT)
  component TOP_DESPERTADOR
    Port (
      CLK : in std_logic;
      ENABLE : in std_logic;
      DATA : inout std_logic_vector(31 downto 0);
      LOAD : in std_logic;
      RESET : in std_logic;
      STOP_ALARM : in std_logic;
      ALARM : out std_logic
    );
  end component;

  -- Signals to connect to the UUT
  signal CLK : std_logic := '0';
  signal ENABLE : std_logic := '0';
  signal DATA : std_logic_vector(31 downto 0) := (others => 'Z');
  signal LOAD : std_logic := '0';
  signal RESET : std_logic := '0';
  signal STOP_ALARM : std_logic := '0';
  signal ALARM : std_logic;

  constant CLK_PERIOD : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: TOP_DESPERTADOR
    Port map (
      CLK => CLK,
      ENABLE => ENABLE,
      DATA => DATA,
      LOAD => LOAD,
      RESET => RESET,
      STOP_ALARM => STOP_ALARM,
      ALARM => ALARM
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
  stim_proc: process
  begin
    -- Initialize Inputs
    RESET <= '1';
    ENABLE <= '0';
    DATA <= (others => 'Z');
    LOAD <= '0';
    STOP_ALARM <= '0';
    wait for 20 ns;

    -- Reset deassertion
    RESET <= '0';
    ENABLE <= '1';
    wait for 20 ns;
    DATA <= X"11111111";
    RESET <= '0';
    ENABLE <= '0';
    wait for 20 ns;
        
    -- Load data
    ENABLE <= '1';
    DATA <= (others => 'Z');
     wait for 20 ns;
    LOAD <= '1';
    DATA <= x"0000000A"; -- Example value
    wait for 4*CLK_PERIOD;
    LOAD <= '0';
   
    DATA <= (others => 'Z');
    -- Enable counting
    ENABLE <= '1';
    wait for 40 ns;
    ENABLE <= '0';
    wait for 40 ns;
    ENABLE <= '1';
    wait for 40 ns;
    ENABLE <= '0';
    reset<= '1';
    wait for 40 ns;
    ENABLE <= '1';
    reset<= '0';
    wait for 40 ns;
    -- Trigger alarm
    
    
    
   

    -- Finish simulation
    wait;
  end process;

end Behavioral;
