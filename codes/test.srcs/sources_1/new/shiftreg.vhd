library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shiftreg is
    Port (  P : IN std_logic_vector(3 downto 0);
            Q : buffer std_logic_vector(3 downto 0);
            clock : IN std_logic;
            clr : IN std_logic;
            serial_in : IN std_logic;
            M : IN std_logic_vector(1 downto 0)
            );
end shiftreg;

architecture Structure of shiftreg is
    signal f : std_logic_vector (3 downto 0 );

component mux4to1
    port ( w0 : in STD_LOGIC;
           w1 : in STD_LOGIC;
           w2 : in STD_LOGIC;
           w3 : in STD_LOGIC;
           M : in STD_LOGIC_VECTOR (1 downto 0);
           f : buffer STD_LOGIC);
end component ;

component Dflipflop
    port ( D : in STD_LOGIC;
           clr : in STD_LOGIC;
           clock : in STD_LOGIC;
           Q : buffer STD_LOGIC);
end component ;


begin
    mux0: mux4to1 port map 
        (Q(0),Q(1),serial_in ,P(0),M(1 downto 0),f(0));
    mux1: mux4to1 port map 
        (Q(1),Q(2),Q(0),P(1),M(1 downto 0),f(1));
    mux2: mux4to1 port map 
        (Q(2),Q(3),Q(1) ,P(2),M(1 downto 0),f(2));
    mux3: mux4to1 port map 
        (Q(3),serial_in ,Q(2),P(3),M(1 downto 0),f(3));
    
    D0: Dflipflop  port map
        (f(0),clr ,clock ,Q(0));
    D1: Dflipflop  port map
        (f(1),clr ,clock ,Q(1));
    D2: Dflipflop  port map
        (f(2),clr ,clock ,Q(2));
    D3: Dflipflop  port map
        (f(3),clr ,clock ,Q(3));
end Structure;
