----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2024 10:41:38
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
  Port ( 
  CLK : in std_logic; --Reloj
  RESET: in std_logic;
  I_L , I_R : in std_logic;
  S : out std_logic_vector(2 downto 0);
  START_STOP : in std_logic;
  L_T : out std_logic; -- Load timer
  L_D : out std_logic; -- Load despertador
  ENABLE: out std_logic;
  SW: in std_logic
  );
end FSM;

architecture behavioral of FSM is
  type STATES is (REST, A_T, A_D);
  signal selector : unsigned(2 downto 0):= "100";
  signal current_state: STATES;
  signal next_state: STATES;
begin
  state_register: process (RESET, CLK)
  begin
    if RESET = '1' then
      current_state <= REST;
      selector <= "100";
    elsif CLK'event and CLK = '1' then
      current_state <= next_state; 
      --Selector value while active
       if current_state = A_T or current_state = A_D then
            if I_L = '1' then
                selector <= selector +1;
            elsif I_R = '1' then
                selector <= selector -1;
            end if;
       end if;    
    end if;
  end process;
  
  nextstate_decod: process (START_STOP, current_state)
  begin
    next_state <= current_state;
    case current_state is
      when REST =>
        if START_STOP = '1' and SW = '0' then      
          next_state <= A_D ;
        end if;
        if START_STOP = '1' and SW = '1' then      
          next_state <= A_T ;
        end if;
      when A_T =>
        if START_STOP = '1' then      
          next_state <= REST;
        end if;
       when A_D =>
        if START_STOP = '1' then      
          next_state <= REST;
        end if;
      when others =>
        next_state <= REST;
    end case;
  end process;

  output_decod: process (current_state)
  begin
    case current_state is
      when REST =>
       ENABLE  <= '0';
       L_T <= '0';
       L_D <= '0'; 
      when A_T =>
       ENABLE <= '1'; 
       L_T <= '1';
       L_D <= '0';
      when A_D =>
       ENABLE <= '1'; 
       L_T <= '0';
       L_D <= '1'; 
      when others => 
        
    end case;
  end process;
  
 S <= std_logic_vector(selector);
 
end behavioral;