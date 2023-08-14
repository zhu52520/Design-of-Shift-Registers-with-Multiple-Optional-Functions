library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dflipflop is
    Port ( D : in STD_LOGIC;
           clr : in STD_LOGIC;
           clock : in STD_LOGIC;
           Q : buffer STD_LOGIC);
end Dflipflop;

architecture Behavioral of Dflipflop is

begin
    process (clr ,clock )
    begin 
        if clr = '0' then
            Q <= '0';
        elsif clock'Event and clock = '1' then
            Q <= D;
        end if ;
    end process ;
end Behavioral;
