----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2024 19:18:43
-- Design Name: 
-- Module Name: TIME_ADDER - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TIME_ADDER is
    Port(
        SEL : in std_logic_vector(2 downto 0); --Selector
        IO_BCD : inout std_logic_vector(31 downto 0); --Salida BCD
        I_U: in std_logic; --ADD 1
        I_D: in std_logic; --SUBSTACT 1
        ENABLE : in std_logic; -- when 1: works like the adder, when 0: stores the value
        CLK: in std_logic);
        
end TIME_ADDER;

architecture Behavioral of TIME_ADDER is

subtype BCD is unsigned(3 downto 0);


function add (entrada, limite : BCD; valor : std_logic) return BCD is
variable salida : BCD;
begin
    if valor = '1' then
        if entrada < limite then 
            salida := entrada + 1;
        else 
            salida := "0000";
        end if;
    elsif valor = '0' then 
        if entrada = "0000" then
            salida := limite;
        else 
            salida := entrada - 1; 
        end if;
    end if;
    return salida;
end function;
begin
main : process(CLK)
variable valor : std_logic;
variable DH, UH, DM, UM, DS, US, DMS, UMS : BCD;
begin 
if rising_edge(CLK)then
    if ENABLE = '1' then
        if I_U = '1' then
            valor := '1';
        elsif I_D = '1' then
            valor := '0';
        end if;
        if I_D = '1' or I_U = '1' then
            case SEL is 
                when "000" => 
                UMS := add( UMS, "1001", valor); 
                when "001" => 
                DMS := add( DMS, "1001", valor); 
                when "010" =>
                US := add( US, "1001", valor); 
                when "011" =>
                DS := add( DS, "0101", valor); 
                when "100" =>
                UM := add( UM, "1001", valor); 
                when "101" =>
                DM := add( DM, "0101", valor); 
                when "110" =>
                if DH < "0010" then
                    UH := add( UH, "1001", valor);
                else 
                     UH := add( UH, "0011", valor);
                end if;    
                when "111" =>
                if UH < "0100" then
                    DH := add( DH, "0010", valor); 
                else 
                    DH := add( DH, "0001", valor);
                end if;
                when others => 
            end case;   
        end if;  
        IO_BCD <=   std_logic_vector(DH) & 
                    std_logic_vector(UH) &
                    std_logic_vector(DM) &
                    std_logic_vector(UM) &
                    std_logic_vector(DS) &
                    std_logic_vector(US) &
                    std_logic_vector(DMS) &
                    std_logic_vector(UMS); 
                    
    elsif ENABLE = '0' then
       IO_BCD <= (others => 'Z');
       DH := unsigned(IO_BCD(31 downto 28));
       UH := unsigned(IO_BCD(27 downto 24));
       DM := unsigned(IO_BCD(23 downto 20));
       UM := unsigned(IO_BCD(19 downto 16));
       DS := unsigned(IO_BCD(15 downto 12));
       US := unsigned(IO_BCD(11 downto 8));
       DMS := unsigned(IO_BCD(7 downto 4));
       UMS := unsigned(IO_BCD(3 downto 0));
                    
    end if;
end if;
end process;

end Behavioral;
