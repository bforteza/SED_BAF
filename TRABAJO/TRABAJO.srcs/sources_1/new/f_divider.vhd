library IEEE;
use IEEE.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity f_divider is
  generic (
    MODULE: positive := 16
  );
  port (
    RESET : in  std_logic;
    CLK   : in  std_logic;
    CE_IN : in  std_logic;
    CE_OUT: out std_logic
  );
end f_divider;

architecture behavioral of f_divider is
signal ce    : std_logic := '0'; -- Señal interna para la salida CE_OUT
  signal count : integer range 0 to MODULE - 1 := MODULE - 1; -- Contador inicializado
begin
  process (RESET, CLK)
  begin
    if RESET = '1' then
      count <= MODULE - 1; -- Reinicia el contador
      ce <= '0';           -- Reinicia la señal CE
    elsif rising_edge(CLK) then
      if CE_IN = '1' then
        if count > 0 then
          count <= count - 1; -- Decrementa el contador
        else
          count <= MODULE - 1; -- Reinicia el contador
          ce <= NOT ce;        -- Invierte la señal CE
        end if;
      end if;
    end if;
  end process;

  CE_OUT <= ce; -- Asigna la señal interna a la salida
end behavioral;
