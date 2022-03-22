LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY reg_tb IS END reg_tb ;

ARCHITECTURE test OF reg_tb IS
    COMPONENT reg IS
        PORT ( clk    : IN  std_logic;
             nrst   : IN  std_logic;--not reset    
             enable : IN  std_logic;
             din    : IN  std_logic_vector(31 DOWNTO 0);
             dout   : OUT std_logic_vector(31 DOWNTO 0)
        );
    END COMPONENT ;
    SIGNAL clk_t , nrst_t , enable_t : std_logic ;
    SIGNAL din_t , dout_t : std_logic_vector(31 DOWNTO 0 );
BEGIN
      U1 : reg PORT MAP (clk_t , nrst_t , enable_t, din_t , dout_t  );
      
      clk_t <='0' , 
              '1' AFTER 20 ns , 
              '0' AFTER 40 ns , 
              '1' AFTER 60 ns , 
              '0' AFTER 80 ns , 
              '1' AFTER 100 ns , 
              '0' AFTER 120 ns ,
              '1' AFTER 140 ns , 
              '0' AFTER 160 ns ;
              
      nrst_t <='0' ,
               '1' AFTER 30 ns , 
               '0' AFTER 110 ns , 
               '1' AFTER 170 ns ;
     
      enable_t <='0' , 
                 '1' AFTER 30 ns , 
                 '0' AFTER 70 ns , 
                 '1' AFTER 110 ns , 
                 '0' AFTER 170 ns ;
                  
      din_t <= "11111111000000001110000011001011" ;
END test;