library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DIGIT_FLASH_tb is
-- Un test bench no tiene puertos
end DIGIT_FLASH_tb;

architecture Behavioral of DIGIT_FLASH_tb is

    -- Componentes a instanciar
    component DIGIT_FLASH
        Port ( 
            IO_BCDA : inout std_logic_vector(31 downto 0);
            IO_BCDB : inout std_logic_vector(31 downto 0);
            CLK     : in std_logic;
            ENABLE  : in std_logic;
            RESET : in std_logic;
            B       : in std_logic_vector(2 downto 0)
        );
    end component;

    -- Señales para conectar al DUT (Device Under Test)
    signal IO_BCDA : std_logic_vector(31 downto 0);
    signal IO_BCDB : std_logic_vector(31 downto 0);
    signal CLK     : std_logic := '0';
    signal ENABLE  : std_logic := '0';
     signal RESET  : std_logic := '0';
    signal B       : std_logic_vector(2 downto 0) := "000";

    -- Reloj de prueba
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instancia del DUT
    UUT: DIGIT_FLASH
        Port map (
            IO_BCDA => IO_BCDA,
            IO_BCDB => IO_BCDB,
            Clk     => CLK,
            ENABLE  => ENABLE,
            RESET => RESET,
            B       => B
        );

    -- Generador de reloj
    clk_process: process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Proceso de estimulación
    stim_proc: process
    begin
        -- Inicialización
        wait for 10 ns; -- Espera inicial

        
        ENABLE <= '0';  
        B <= "000";     
        IO_BCDB <= (others => 'Z'); 
        IO_BCDA <= X"00000000"; 
        wait for 150 ns;
        assert (IO_BCDB = (IO_BCDB'range => '0')) report "Fallo 1: A no sigue B" severity error;
          ENABLE <= '0';
            
        ENABLE <= '1';     
        B <= "000";     
        IO_BCDA <= (others => 'Z'); 
        IO_BCDB <= X"FFFFFFFF"; 
        wait for 100 ns;
        assert (IO_BCDB = (IO_BCDB'range => '1')) report "Fallo 1: B no sigue A" severity error;
        --PRUEBA VISUAL
        B <= "001"; 
        wait for 100 ns; 
        B <= "010"; 
        wait for 100 ns; 
        B <= "011"; 
        ENABLE <= '0';
        wait for 100 ns; 
        B <= "100"; 
        wait for 100 ns;
         B <= "101"; 
        wait for 100 ns; 
        B <= "110"; 
        wait for 100 ns; 
        B <= "111"; 
        wait for 100 ns; 
        B <= "000"; 
        wait for 100 ns;
        ENABLE <= '0';
    end process;

end Behavioral;
