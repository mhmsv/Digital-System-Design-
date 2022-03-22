LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY reg IS 
   PORT ( clk    : IN  std_logic;
          nrst   : IN  std_logic;--not reset    
          enable : IN  std_logic;
          din    : IN  std_logic_vector(31 DOWNTO 0);
          dout   : OUT std_logic_vector(31 DOWNTO 0)
        );
END reg;
ARCHITECTURE test OF reg IS
BEGIN
   PROCESS(clk)
   BEGIN
      IF rising_edge(clk) THEN
          IF ( nrst= '0') THEN
             dout <= "00000000000000000000000000000000" ;
          ELSIF ( enable = '1' ) THEN
              dout <= din ;
          END IF;
      END IF;
   END PROCESS;      
END test;