library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LONG_PULSE_DETECTOR is
  generic (
    REG_LENGTH : integer := 41 -- Longitud del registro
  );
  port (
    CLK : in std_logic;
    SYNC_IN : in std_logic;
    EDGE : out std_logic
  );
end LONG_PULSE_DETECTOR;

architecture Behavioral of LONG_PULSE_DETECTOR is
  signal sreg : std_logic_vector(REG_LENGTH - 1 downto 0) := (others => '0'); -- Inicialización
begin
  process (CLK)
  begin
    if rising_edge(CLK) then
      -- Desplazamiento del registro con la nueva entrada
      sreg <= sreg(REG_LENGTH - 2 downto 0) & SYNC_IN;

      -- Condición de reseteo del registro
      if sreg = (sreg'range => '1') then
        sreg <= (others => '0');
      end if;
    end if;
  end process;

  -- Generación de la señal EDGE cuando sreg cumple una condición específica
  EDGE <= '1' when sreg = (sreg'range => '1') else '0';

end Behavioral;
