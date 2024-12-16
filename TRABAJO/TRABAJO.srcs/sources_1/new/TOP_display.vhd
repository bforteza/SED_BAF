----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 16:49:48
-- Design Name: 
-- Module Name: TOP_display - Behavioral
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
use IEEE.std_logic_1164.all;

entity TOP_display is
  port (
    CLK       : in  std_logic;                    -- Señal de reloj
    --data_in   : in  std_logic_vector(31 downto 0); -- Entrada externa de 32 bits
    seg       : out std_logic_vector(6 downto 0);  -- Salida al display de 7 segmentos
    AN      : out std_logic_vector(7 downto 0)   -- Salidas de activación de los display
  );
end TOP_display;

architecture Behavioral of TOP_display is


  -- Señales internas
  signal contador_out : std_logic_vector(2 downto 0); -- Salida del contador (3 bits)
  signal mux_out      : std_logic_vector(3 downto 0); -- Salida del MUX (4 bits)
  signal decoder_out  : std_logic_vector(7 downto 0); -- Salida del decodificador binario (8 bits)
  signal data_in      : std_logic_vector(31 downto 0) := "00000001001000110100010101100111" ; 
  signal clk_div      : std_logic;
begin


clock_divider_inst : entity work.clock_divider
    port map (
      clk_in  => CLK,       -- Conexión del reloj de entrada principal
      clk_out => clk_div    -- Salida del reloj dividido
    );
    
    
  -- Instancia del contador (0 a 7)
  contador_inst : entity work.contador_0_a_7
    port map (
      clk   => clk_div,
      count => contador_out
    );

  -- Instancia del MUX
  mux_inst : entity work.mux_32bit_4out
    port map (
      data_in  => data_in,
      sel      => contador_out, -- Conectar directamente los 3 bits del contador
      data_out => mux_out
    );

  -- Instancia del decodificador de 7 segmentos
  bcd_to_7seg_inst : entity work.bcd_to_7seg
    port map (
      bcd => mux_out,
      seg => seg
    );

  -- Instancia del decodificador binario a 8 salidas
  binary_decoder_inst : entity work.binary_3bit_decoder
    port map (
      binary_in => contador_out, -- Conectar directamente los 3 bits del contador
      output    => AN
    );
    


end Behavioral;

