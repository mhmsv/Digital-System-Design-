LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_tb IS END counter_tb ;
ARCHITECTURE sample OF counter_tb IS
    CONSTANT data_width : INTEGER := 32;
    COMPONENT universal_counter IS 
        GENERIC(n : INTEGER := 32);
        PORT( din   :IN   STD_LOGIC_VECTOR(n-1 DOWNTO 0);
              op    :IN   STD_LOGIC_VECTOR(2 DOWNTO 0);
              nrst  :IN   STD_LOGIC;
              clk   :IN   STD_LOGIC;
              dout  :OUT  STD_LOGIC_VECTOR(n-1 DOWNTO 0));
    END component;
    
    SIGNAL  din_t , dout_t : STD_LOGIC_VECTOR( data_width-1 DOWNTO 0 );
    SIGNAL  op_t  : STD_LOGIC_VECTOR( 2 DOWNTO 0 );
    SIGNAL  clk_t , nrst_t : STD_LOGIC ;
BEGIN
    u1 :   universal_counter GENERIC MAP(n => data_width)
                PORT MAP(
                        din => din_t,
                        op  => op_t ,
                        nrst=> nrst_t ,
                        clk => clk_t ,
                        dout=> dout_t);
                        
    -- az inja meqdardehia shoroo mishe
    
            din_t <= "00000000000000000000000001100111";
            clk_t <='0' , 
              '1' AFTER 10 ns , 
              '0' AFTER 20 ns , 
              '1' AFTER 30 ns , 
              '0' AFTER 40 ns , 
              '1' AFTER 50 ns , 
              '0' AFTER 60 ns ,
              '1' AFTER 70 ns , 
              '0' AFTER 80 ns ,
              '1' AFTER 90 ns , 
              '0' AFTER 100 ns , 
              '1' AFTER 110 ns , 
              '0' AFTER 120 ns , 
              '1' AFTER 130 ns , 
              '0' AFTER 140 ns ,
              '1' AFTER 150 ns ,
              '0' AFTER 160 ns , 
              '1' AFTER 170 ns , 
              '0' AFTER 180 ns ,
              '1' AFTER 190 ns ,
              '0' AFTER 200 ns ,
              '1' AFTER 210 ns , 
              '0' AFTER 220 ns , 
              '1' AFTER 230 ns , 
              '0' AFTER 240 ns ,
              '1' AFTER 250 ns ,
              '0' AFTER 260 ns , 
              '1' AFTER 270 ns , 
              '0' AFTER 280 ns ,
              '1' AFTER 290 ns ,
              '0' AFTER 300 ns ;
               
            nrst_t <='0' ,
              '1' AFTER 15 ns ;
     
            op_t <="000" ,  --meqdardehi avalie: hich kari nemikone--
                  "001" AFTER 25 ns,--nemayeshe khode adad--
                  "010" AFTER 45 ns,--count up--
                  "001" AFTER 65 ns,--show--
                  "011" AFTER 85 ns,--count down--
                  "001" AFTER 105 ns,--show--
                  "100" AFTER 125 ns,--logical right shift--
                  "001" AFTER 145 ns,--show--
                  "101" AFTER 165 ns,--logical left shift--
                  "001" AFTER 185 ns,--show--
                  "110" AFTER 205 ns,--circular right shift--
                  "001" AFTER 225 ns,--show--
                  "111" AFTER 245 ns,--circular left shift--
                  "001" AFTER 265 ns;--show--
    
END sample;
