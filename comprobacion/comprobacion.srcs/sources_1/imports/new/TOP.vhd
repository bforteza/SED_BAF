

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TOP is
  Port (
  IO_BCD : inout std_logic_vector(31 downto 0);
  CLK : in std_logic;
  RESET: in std_logic;
  START_STOP: in std_logic;
  I_U : in std_logic;
  I_L : in std_logic;
  I_R : in std_logic;
  I_D : in std_logic;
  LOAD : out std_logic
  
    );
end TOP;

architecture Behavioral of TOP is

component FSM is
  Port ( 
  CLK : in std_logic;
  RESET: in std_logic;
  I_L , I_R : in std_logic;
  S : out std_logic_vector(2 downto 0);
  START_STOP : in std_logic;
  ENABLE: out std_logic
  );
end component;

component DIGIT_FLASH is
    Port (
      IO_BCDA : inout std_logic_vector(31 downto 0);
      IO_BCDB : inout std_logic_vector(31 downto 0);
      CLK     : in std_logic;
      ENABLE  : in std_logic;
      F_ENABLE : in std_logic;
      RESET   : in std_logic;
      SEL       : in std_logic_vector(2 downto 0)
    );
  end component;
  component TIME_ADDER is
    Port(
        SEL : in std_logic_vector(2 downto 0); --Selector
        IO_BCD : inout std_logic_vector(31 downto 0); --Salida BCD
        I_U: in std_logic; --ADD 1
        I_D: in std_logic; --SUBSTACT 1
        ENABLE : in std_logic; -- when 1: works like the adder, when 0: stores the value
        CLK: in std_logic);
        
end component;

component SYNCHRNZR is
 port (
 CLK : in std_logic;
 ASYNC_IN : in std_logic;
 SYNC_OUT : out std_logic
 );
 end component;
 

component EDGEDTCTR is
 port (
 CLK : in std_logic;
 SYNC_IN : in std_logic;
 EDGE : out std_logic
 );
 
end component;


signal IO_BCD_INT : std_logic_vector(31 downto 0);
signal ENABLE : std_logic;
signal SEL : std_logic_vector(2 downto 0);
signal I_U_SIN : std_logic;
signal I_D_SIN : std_logic;
signal I_L_SIN : std_logic;
signal I_R_SIN : std_logic;
signal START_STOP_SIN : std_logic;

signal I_U_EDG : std_logic;
signal I_D_EDG : std_logic;
signal I_L_EDG : std_logic;
signal I_R_EDG : std_logic;
signal START_STOP_EDG : std_logic;



begin
LOAD <= enable;
u_FSM : FSM 
  Port map( 
  CLK =>   CLK,
  RESET => RESET,
  I_L => I_L_EDG,
  I_R => I_R_EDG,
  S => SEL,
  START_STOP => START_STOP_EDG,
  ENABLE => ENABLE
  );

-- DIGIT_FLASH Instance
  u_DIGIT_FLASH: DIGIT_FLASH
    port map (
      IO_BCDA => IO_BCD,
      IO_BCDB => IO_BCD_INT,
      CLK => CLK,
      ENABLE => ENABLE,
      F_ENABLE => not START_STOP,
      RESET => RESET,
      SEL => SEL
    );

  -- TIME_ADDER Instance
  u_TIME_ADDER: TIME_ADDER
    port map (
      SEL => SEL,
      IO_BCD => IO_BCD,
      I_U => I_U_EDG,
      I_D => I_D_EDG,
      ENABLE => ENABLE,
      CLK => CLK
    );

  -- SYNCHRNZR Instance
  u_SYNCHRNZR_U: SYNCHRNZR
    port map (
      CLK => CLK,
      ASYNC_IN => I_U,
      SYNC_OUT => I_U_SIN
    );
    
    u_SYNCHRNZR_D: SYNCHRNZR
    port map (
      CLK => CLK,
      ASYNC_IN => I_D,
      SYNC_OUT => I_D_SIN
    );
    
    u_SYNCHRNZR_L: SYNCHRNZR
    port map (
      CLK => CLK,
      ASYNC_IN => I_L,
      SYNC_OUT => I_L_SIN
    );
    
    u_SYNCHRNZR_R: SYNCHRNZR
    port map (
      CLK => CLK,
      ASYNC_IN => I_R,
      SYNC_OUT => I_R_SIN
    );
    
     u_SYNCHRNZR_START: SYNCHRNZR
    port map (
      CLK => CLK,
      ASYNC_IN => START_STOP,
      SYNC_OUT => START_STOP_SIN
    );

  -- LONG_PULSE_DETECTOR Instance
  u_EDGEDTCTR_START: EDGEDTCTR
    port map (
      CLK => CLK,
      SYNC_IN => START_STOP_SIN,
      EDGE => START_STOP_EDG
    );

  -- EDGEDTCTR Instance
  u_EDGEDTCTR_R: EDGEDTCTR
    port map (
      CLK => CLK,
      SYNC_IN => I_R_SIN,
      EDGE => I_R_EDG
    );
     -- EDGEDTCTR Instance
  u_EDGEDTCTR_L: EDGEDTCTR
    port map (
      CLK => CLK,
      SYNC_IN => I_L_SIN,
      EDGE => I_L_EDG
    );
     -- EDGEDTCTR Instance
  u_EDGEDTCTR_U: EDGEDTCTR
    port map (
      CLK => CLK,
      SYNC_IN => I_U_SIN,
      EDGE => I_U_EDG
    ); -- EDGEDTCTR Instance
  u_EDGEDTCTR_D: EDGEDTCTR
    port map (
      CLK => CLK,
      SYNC_IN => I_D_SIN,
      EDGE => I_D_EDG
    );
    

end Behavioral;
