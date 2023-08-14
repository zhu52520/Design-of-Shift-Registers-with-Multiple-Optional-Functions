library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY shiftreg_test IS
END shiftreg_test;

ARCHITECTURE behavior OF shiftreg_test IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT shiftreg
    PORT(
            P : IN std_logic_vector(3 downto 0);
            Q : buffer std_logic_vector(3 downto 0);
            clock : IN std_logic;
            clr : IN std_logic;
            serial_in : IN std_logic;
            m : IN std_logic_vector(1 downto 0)
            );
END COMPONENT;

--Inputs
signal P : std_logic_vector(3 downto 0) := (others => '0');
signal clock : std_logic := '0';
signal clr : std_logic := '0';
signal serial_in : std_logic := '0';
signal m : std_logic_vector(1 downto 0) := (others => '0');
--Outputs
signal Q : std_logic_vector(3 downto 0); 


-- Clock period definitions
constant clock_period : time := 20ns;
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: shiftreg PORT MAP (
                        P => P,
                        Q => Q,
                        clock => clock,
                        clr => clr,
                        serial_in => serial_in,
                        m => m
                        );
                        
                        
-- Clock process definitions
clock_process :process
begin
    clock <= '0';
    wait for clock_period/2;
    clock <= '1';
    wait for clock_period/2;
end process;


-- Stimulus process
stim_proc: process
begin
    -- test CLR
    clr<='0'; 
    wait for 30ns;
    
    -- test parallel load
    clr<='1';
    m<="11";
    P<="0110";
    wait for 40ns;
    
    -- test right shift
    m<="01";
    serial_in<='1';
    wait for 80ns; -- shift 4 bits
    
    -- test left shift
    m<="10";
    serial_in <='0';
    wait for 80ns; -- shift 4 bits
    
    -- test no change 
    m<="00";
    wait for 10ns;
    serial_in <='1';
    P<="1111";
    wait for 80ns;
    wait;
    
end process;
END;