----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 17:19:34
-- Design Name: 
-- Module Name: fdivider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fdivider is
  generic (
    module : positive := 100000000 -- Frecuencia del reloj en Hz (por defecto 100 MHz)
  );
  port (
    RESET  : in  std_logic; -- Señal de reset
    CLK    : in  std_logic; -- Reloj
    CE_IN  : in  std_logic := '1'; -- Habilitación de entrada
    CE_OUT : out std_logic  -- Señal de salida activa cada milisegundo
  );
end fdivider;

architecture Behavioral of fdivider is
begin
 process (RESET, CLK)
    subtype count_range is integer range 0 to module - 1;
    variable count: count_range;
  begin
    if RESET = '1' then
      count := count_range'high;
      CE_OUT <= '0';
    elsif rising_edge(CLK) then
      CE_OUT <= '0';
      if CE_IN = '1' then
        if count /= 0 then
          count := count - 1;
        else
          CE_OUT <= '1';
          count := count_range'high;
        end if;
      end if;        
    end if;
  end process;
 
end Behavioral;
