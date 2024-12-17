----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2024 12:48:41
-- Design Name: 
-- Module Name: tb_fdivider - Behavioral
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

entity tb_fdivider is
end tb_fdivider;

architecture Behavioral of tb_fdivider is
    -- Signals for the fdivider component
    signal CLK       : std_logic := '0';
    signal RESET     : std_logic := '0';
    signal CE_IN     : std_logic := '1';
    signal CE_OUT    : std_logic;

    -- Constant for clock period (100 MHz)
    constant CLK_PERIOD : time := 10 ps;  -- Corresponds to a 100 MHz clock
begin
    -- Instantiate the fdivider component
    uut: entity work.fdivider
        generic map (
            CLK_FREQ => 100000000  -- 100 MHz clock frequency
        )
        port map (
            RESET  => RESET,
            CLK    => CLK,
            CE_IN  => CE_IN,
            CE_OUT => CE_OUT
        );

    -- Generate the clock signal
    CLK_process : process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stimulus_process : process
    begin
        -- Apply RESET
        RESET <= '1';
        wait for 20 * CLK_PERIOD;
        RESET <= '0';
        
        -- Test 1: Check the operation with CE_IN = '1'
        -- Wait for a few cycles and observe CE_OUT
        wait for 10 * CLK_PERIOD;
        -- Test for a few more cycles, CE_OUT should be toggling every millisecond
        wait for 100 * CLK_PERIOD;
        
        -- Test 2: Set CE_IN to '0' and verify that CE_OUT doesn't toggle
        CE_IN <= '0';
        wait for 200 * CLK_PERIOD;

        -- Test 3: Re-enable CE_IN and check the behavior again
        CE_IN <= '1';
        wait for 200 * CLK_PERIOD;

        -- Finish the simulation
        wait;
    end process;
end Behavioral;
