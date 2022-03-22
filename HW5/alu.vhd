LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY alu IS 
    PORT( a         :IN   STD_LOGIC_VECTOR(31 DOWNTO 0);
          b         :IN   STD_LOGIC_VECTOR(31 DOWNTO 0);
          func      :IN   STD_LOGIC_VECTOR(3  DOWNTO 0);
          cin       :IN   STD_LOGIC;
          sin       :IN   STD_LOGIC;
          cout      :OUT  STD_LOGIC;
          sout      :OUT  STD_LOGIC;
          ov        :OUT  STD_LOGIC;
          z         :OUT  STD_LOGIC_VECTOR(31 DOWNTO 0));
END alu;

ARCHITECTURE sample OF alu IS 

    COMPONENT bit_slice IS
    PORT( a         :IN   STD_LOGIC;
          b         :IN   STD_LOGIC;
          func      :IN   STD_LOGIC;
          cin       :IN   STD_LOGIC;
          sin       :IN   STD_LOGIC;
          cout      :OUT  STD_LOGIC;
          sout      :OUT  STD_LOGIC;
          ov        :OUT  STD_LOGIC;
          z         :OUT  STD_LOGIC);
    END COMPONENT; 
    
    SIGNAL cins :  STD_LOGIC_VECTOR(31 DOWNTO 0);  
    SIGNAL sins :  STD_LOGIC_VECTOR(31 DOWNTO 0); 
    SIGNAL couts :  STD_LOGIC_VECTOR(31 DOWNTO 0);  
    SIGNAL souts :  STD_LOGIC_VECTOR(31 DOWNTO 0); 
    SIGNAL outs :  STD_LOGIC_VECTOR(31 DOWNTO 0); 
    SIGNAL ovs  :  STD_LOGIC_VECTOR(31 DOWNTO 0); 
BEGIN
    			build32alu :for j in 0 to 31 generate
			alu1bit : bit_slice PORT MAP(a(j) , b(j) , func , cin(j) , sin(j) , cout(j) , sout(j) , ov(j) , z(j));    
			       end generate;
			       
			       PROCESS ( func , outs , couts , a , b , cin , sin,souts)
			       BEGIN
			           IF func="0000" THEN -- manfie B
					cins(0)<='1';
					z(0)<=outs(0);
			                FOR i IN 0 TO 31 LOOP
                          		z(i) <= outs(i);
					cins(i) <=couts(i-1)
                      			END LOOP;
			            ELSIF func="0001" THEN -- A+B (2?s comp Add without carry)
					FOR i IN 0 TO 31 LOOP
                          		z(i) <= outs(i);
                      			END LOOP;
                  		    ELSIF func="0010" THEN -- A+B+Cin (2?s comp Add with carry)
                  
                  		    ELSIF func="0011" THEN -- A-B (2?s comp subtraction without carry)
                  
                  		    ELSIF func="0100" THEN -- -B (2?s comp of B)

                 		    ELSIF func="0101" THEN -- ~B (Bitwise NOT)
                      			FOR i IN 0 TO 31 LOOP
                       			   z(i) <= outs(i);
                     			 END LOOP;
                  		    ELSIF func="0110" THEN -- A & B (A AND B)
                      			FOR i IN 0 TO 31 LOOP
                         		 z(i) <= outs(i);
                      			END LOOP;
                  		    ELSIF func="0111" THEN -- A | B (A OR B)
                      			FOR i IN 0 TO 31 LOOP
                          		 z(i) <= outs(i);
                      			END LOOP;
                 		    ELSIF func="1000" THEN -- A ^ B (A XOR B)
                     			 FOR i IN 0 TO 31 LOOP
                         		 z(i) <= outs(i);
                      			END LOOP;
                  ELSIF func="1001" THEN -- One bit logical left shift of A
                  
                  ELSIF func="1010" THEN -- One bit logical right shift of A
                  
                  ELSIF func="1011" THEN -- One bit circular left shift of A, input bit is sin, output bit is sout
                  
                  ELSIF func="1100" THEN -- One bit circular right shift of A, input bit is sin, output bit is sout
                  
                  ELSIF func="1101" THEN -- Z = 1 if A>B else 0
                  
                  ELSIF func="1110" THEN -- Z = 1 if A<B else 0
                  
                  ELSIF func="1111" THEN -- Z = 1 if A=B else 0
                  
                END IF;			            
			     END PROCESS;       
			            
END sample;



