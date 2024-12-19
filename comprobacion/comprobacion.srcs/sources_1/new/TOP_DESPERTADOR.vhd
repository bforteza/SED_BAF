

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TOP_DESPERTADOR is
  Port (
  CLK : in std_logic;
  ENABLE : in std_logic;
  DATA : inout std_logic_vector(31 downto 0);
  LOAD : in std_logic;
  RESET : in std_logic;
  STOP_ALARM : in std_logic;
  ALARM : out std_logic
   );
end TOP_DESPERTADOR;

architecture Behavioral of TOP_DESPERTADOR is

type STATES is (LOADING, REST_ON, REST_OFF , ALARM_ON);
  signal current_state: STATES := REST_OFF;
  signal next_state: STATES  := REST_OFF;
  signal value : std_logic_vector( 31 downto 0) := (others => '0');
begin
  state_register: process (RESET, CLK)
  begin
    if RESET = '1' then
      current_state <= REST_OFF;
      value <= (others => '0');
    elsif CLK'event and CLK = '1' then
    
      current_state <= next_state;
      if current_state = LOADING and next_state = LOADING then
        value <= DATA;
       end if;     
    end if;
    
  end process;
  
  nextstate_decod: process (LOAD,ENABLE,STOP_ALARM, current_state)
  begin
    next_state <= current_state;
    case current_state is
      when LOADING =>
        if LOAD = '0' then           
          next_state <= REST_ON;     
        end if;
        if ENABLE = '0' then
          next_state <= REST_OFF;
        end if;
      when REST_OFF =>
        if DATA = value and stop_alarm = '0' then      
          next_state <= ALARM_ON;
        end if;
        if ENABLE = '1' then
          next_state <= REST_ON;
        end if;       
      when ALARM_ON => 
        if STOP_ALARM = '1' then      
          next_state <= REST_OFF;
        end if;
        if enable = '1' then 
          next_state <= REST_ON;
        END IF;
      when REST_ON => 
        if ENABLE = '0' then      
          next_state <= REST_OFF;
        end if;
        if LOAD = '1' then
          next_state <= LOADING;
        end if;
      when others =>
        next_state <= rest_off;
    end case;
  end process;

  output_decod: process (current_state)
  begin
    case current_state is
      when LOADING =>
        DATA <= (OTHERS => 'Z');
        ALARM <= '0';
      when ALARM_ON =>
        ALARM <= '1';
      when REST_OFF => 
        ALARM <= '0';
        DATA <= (OTHERS => 'Z');    
      when REST_ON =>
        DATA <= VALUE; 
        ALARM <= '0'; 
      when others =>        
    end case;
  end process;
end behavioral;


