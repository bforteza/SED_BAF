library ieee;
use ieee.std_logic_1164.all;

entity tb_TOP is
end tb_TOP;

architecture tb of tb_TOP is

    component TOP
        port (IO_BCD     : inout std_logic_vector (31 downto 0);
              CLK        : in std_logic;
              RESET      : in std_logic;
              START_STOP : in std_logic;
              I_U        : in std_logic;
              I_L        : in std_logic;
              I_R        : in std_logic;
              I_D        : in std_logic);
    end component;

    signal IO_BCD     : std_logic_vector (31 downto 0);
    signal CLK        : std_logic;
    signal RESET      : std_logic;
    signal START_STOP : std_logic;
    signal I_U        : std_logic;
    signal I_L        : std_logic;
    signal I_R        : std_logic;
    signal I_D        : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : TOP
    port map (IO_BCD     => IO_BCD,
              CLK        => CLK,
              RESET      => RESET,
              START_STOP => START_STOP,
              I_U        => I_U,
              I_L        => I_L,
              I_R        => I_R,
              I_D        => I_D);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK is really your main clock signal
    CLK <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        RESET <= '0';
        START_STOP <= '0';
        I_U <= '0';
        I_L <= '0';
        I_R <= '0';
        I_D <= '0';
        
        IO_BCD <= "0000 0001 0000 0000 0110 0000 0000 0000"
        -- EDIT Add stimuli here
        START_STOP <= '1';
        wait for 20 * TbPeriod;
        START_STOP <= '1';
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_TOP of tb_TOP is
    for tb
    end for;
end cfg_tb_TOP;


end Behavioral;
