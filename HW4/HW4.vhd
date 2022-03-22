LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY universal_counter IS 
    GENERIC(n : INTEGER := 32);
    PORT( din   :IN   STD_LOGIC_VECTOR(n-1 DOWNTO 0);
          op    :IN   STD_LOGIC_VECTOR(2 DOWNTO 0);
          nrst  :IN   STD_LOGIC;
          clk   :IN   STD_LOGIC;
          dout  :OUT  STD_LOGIC_VECTOR(n-1 DOWNTO 0));
END universal_counter;

ARCHITECTURE counter1 OF universal_counter IS
BEGIN

    PROCESS(op , clk,nrst)
	    variable temp : STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;    
    BEGIN
       IF rising_edge(clk) THEN
                  IF nrst = '0' THEN
                dout <= (OTHERS => '0' );
            ELSIF (clk'event and clk='1') THEN
               
                     IF op="000" THEN
                       null;
                     ELSIF op="001" THEN
                        temp := din ;
			dout <= temp;
                    ELSIF op="010" THEN
                        temp := temp + 1;  
                    ELSIF op="011" THEN
                      temp := temp - 1;
                    ELSIF op="100" THEN
                        temp := '0' & temp(n-1 DOWNTO 1);
                    ELSIF op="101" THEN
                        temp := temp(n-2 DOWNTO 0) & '0';
                    ELSIF op="110" THEN
                        temp := temp(0) & temp(n-1 DOWNTO 1);
                    ELSIF op="111" THEN
                        temp := temp(n-2 DOWNTO 0) & temp(n-1);
                        
                    END IF;
                    
                END IF;
               --age eshtebah bood dout <= temp ro bezar inja
	
            END IF;
         dout <= temp;
    END PROCESS;    
END counter1;