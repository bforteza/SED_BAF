library ieee;
use ieee.std_logic_1164.all;

entity f_divider_tb is
end f_divider_tb;

architecture behavior of f_divider_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component f_divider
    generic (
      MODULE: positive
    );
    port(
      RESET : in  std_logic;
      CLK   : in  std_logic;
      CE_IN : in  std_logic;
      CE_OUT: out std_logic
    );
  end component;

  --Inputs
  signal reset : std_logic;
  signal clk   : std_logic;
  signal ce_in : std_logic := '1';

  --Outputs
  signal ce_out: std_logic;

  -- Clock period definitions
  constant clk_period: time     := 10 ns;

  constant module    : positive := 8;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: f_divider
    generic map (
      MODULE => module
    )
    port map (
      RESET  => reset,
      CLK    => clk,
      CE_IN  => ce_in,
      CE_OUT => ce_out
    );

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for 0.5 * clk_period;
    clk <= '1';
    wait for 0.5 * clk_period;
  end process;

  reset <= '1' after 0.25 * clk_period, '0' after 0.75 * clk_period;
  
  -- Stimulus process
  stim_proc: process
    variable tref: time;
  begin
    wait until CE_OUT = '0';
    wait until CE_OUT = '0';
    tref := now;
    wait until CE_OUT = '0';
    assert now - tref = module * clk_period
      report "[ERROR]: Wrong timing."
      severity failure;
    
    wait for 0.25 * clk_period;

    assert false
      report "[SUCCESS]: Simulation finished."
      severity failure;
  end process;
end;
