library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux4to1 is
    Port ( w0 : in STD_LOGIC;
           w1 : in STD_LOGIC;
           w2 : in STD_LOGIC;
           w3 : in STD_LOGIC;
           M : in STD_LOGIC_VECTOR (1 downto 0);
           f : buffer STD_LOGIC);
end mux4to1;

architecture Behavioral of mux4to1 is

begin
    with M select 
        f <= w0 when "00",
             w1 when "01",
             w2 when "10",
             w3 when others;
end Behavioral;
