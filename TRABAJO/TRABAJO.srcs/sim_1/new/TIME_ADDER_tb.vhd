library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_TIME_ADDER is
-- No hay puertos en el test bench
end TB_TIME_ADDER;

architecture Behavioral of TB_TIME_ADDER is

    -- Component declaration
    component TIME_ADDER is
        Port(
            S : in std_logic_vector(2 downto 0);
            IO_BCD : inout std_logic_vector(31 downto 0);
            I_U : in std_logic;
            I_D : in std_logic;
            ENABLE : in std_logic;
            CLK : in std_logic
        );
    end component;

    -- Signals for test
    signal S : std_logic_vector(2 downto 0) := "000";
    signal IO_BCD : std_logic_vector(31 downto 0) := (others => 'Z');
    signal I_U : std_logic := '0';
    signal I_D : std_logic := '0';
    signal ENABLE : std_logic := '0';
    signal CLK : std_logic := '0';

    -- Clock generation
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the TIME_ADDER
    DUT: TIME_ADDER
        Port map (
            S => S,
            IO_BCD => IO_BCD,
            I_U => I_U,
            I_D => I_D,
            ENABLE => ENABLE,
            CLK => CLK
        );

    -- Clock process
    CLK_process : process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimuli process
    stimuli_process : process
    begin
        S <= "000";
        ENABLE <= '0';
        IO_BCD <= (others => '0'); 
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        
         
         
        ENABLE <= '1';
        IO_BCD <= (others => 'Z');
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
         assert (IO_BCD = (IO_BCD'range => '0')) report "Fallo 1: no almacena el valor" severity error;
        
        I_U <= '1';
        wait for CLK_PERIOD;
         I_U <= '0';
       
         assert (IO_BCD = X"00000001") report "Fallo 2: no suma" severity error;
        I_U <= '1';
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        I_U <= '0';
          
         assert (IO_BCD = X"00000000") report "Fallo 3: no vuelve a 0" severity error;  
         I_D <= '1';
         wait for CLK_PERIOD;
         assert(IO_BCD = x"00000009") report "Fallo 4: no vuelve a 9 restando" severity error;
               
         wait for CLK_PERIOD;
           wait for CLK_PERIOD;
           wait for CLK_PERIOD;
           wait for CLK_PERIOD;
                   ENABLE <= '1';
          S <= "011";
        wait for CLK_PERIOD;
        assert(IO_BCD = x"00005005") report "Fallo 4: no sube a 5 restando" severity error;
        wait;
        wait;
    end process;

end Behavioral;
