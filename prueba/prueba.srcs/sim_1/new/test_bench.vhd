----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2024 12:24:05
-- Design Name: 
-- Module Name: test_bench - Behavioral
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

entity e1_tb is 
end e1_tb; 
 
architecture behavioral of e1_tb is  
  component e1 
    generic(n: positive); 
    port(a,b,c: in  std_logic; 
      y: out std_logic); 
  end component; 
  signal a,c,y: std_logic; 
  signal b: std_logic := '0'; 
begin 
 
  uut: e1 
  generic map(n => 4) 
  port map(a => a, b => b, c => c, y => y); 
 
  a <= '0', '1' after 75 ns; 
  b <= not b after 50 ns; 
 
  tb : process 
  begin 
    c <= '0'; wait for 25 ns; 
    c <= '1'; wait for 200 ns; 
    c <= '0'; wait for 400 ns; 
    c <= '1'; wait for 475 ns; 
    assert false 
      report "Simulación finalizada" 
      severity failure; 
  end process; 
end;

