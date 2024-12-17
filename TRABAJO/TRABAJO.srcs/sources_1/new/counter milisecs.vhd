----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 17:19:26
-- Design Name: 
-- Module Name: counter milisecs - Behavioral
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

entity counter_bcd is
     Port ( 
           clk : in std_logic;
           CE : in std_logic;
           RST_N : in std_logic;
           code : out std_logic_vector(3 downto 0)
           );
end counter_bcd;

architecture Behavioral of counter_bcd is
    signal code_i : unsigned(code'range);
begin
    process(clk, RST_N)
begin
    if RST_N = '0' then
    code_i <= (others => '0');
    elsif rising_edge(clk) then 
        if CE = '1' then 
        if code_i = "1001" then
         code_i <= (others => '0');
        else 
        code_i <= code_i +1;
        end if;
    end if;  
    end if;
    end process;
   code <= std_logic_vector(code_i);

end Behavioral;
