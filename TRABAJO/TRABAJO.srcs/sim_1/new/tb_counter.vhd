----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 13:11:09
-- Design Name: 
-- Module Name: tb_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity tb_counter is
-- Testbench no tiene puertos
end tb_counter;

architecture Behavioral of tb_counter is

  -- Component declaration for the unit under test (UUT)
  component counter
    generic (
      SIZE: positive := 4
    );
    port (
      CLK      : in  std_logic;
      RESET    : in  std_logic;
      C_IN     : in  std_logic;
      DATA     : inout std_logic_vector(SIZE - 1 downto 0);
      C_OUT    : out std_logic;
      LOAD     : in  std_logic
    );
  end component;

  -- Signals to connect to UUT
  signal CLK      : std_logic := '0';
  signal RESET    : std_logic := '0';
  signal C_IN     : std_logic := '0';
  signal DATA     : std_logic_vector(3 downto 0) := (others => 'Z');
  signal C_OUT    : std_logic;
  signal LOAD     : std_logic := '0';

  constant CLK_PERIOD : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: counter
    generic map (
      SIZE => 4
    )
    port map (
      CLK   => CLK,
      RESET => RESET,
      C_IN  => C_IN,
      DATA  => DATA,
      C_OUT => C_OUT,
      LOAD  => LOAD
    );

  -- Clock generation
  clk_process: process
  begin
    while true loop
      CLK <= '1';
      wait for CLK_PERIOD / 2;
      CLK <= '0';
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- Stimulus process
  stimulus: process
  begin
    -- Test Case 1: Reset the counter
    RESET <= '1';
    wait for 2 * CLK_PERIOD;
    RESET <= '0';
    wait for 2 * CLK_PERIOD;

    -- Test Case 2: Load a value into the counter
    LOAD <= '1';
    DATA <= "0011"; -- Load the value 3
    wait for 2*  CLK_PERIOD;
    LOAD <= '0';
    DATA <= "ZZZZ" ; -- Release the DATA bus
    wait for 2 * CLK_PERIOD;

    -- Test Case 3: Increment the counter with C_IN = 1
    C_IN <= '1';
    wait for 5 * CLK_PERIOD;

    -- Test Case 4: Overflow the counter
    wait for 10 * CLK_PERIOD;

    -- Test Case 5: Reset during operation
    RESET <= '1';
    wait for 2 * CLK_PERIOD;
    RESET <= '0';
    wait for 2 * CLK_PERIOD;

    -- Finish simulation
    wait;
  end process;

end Behavioral;

