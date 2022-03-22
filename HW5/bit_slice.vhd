LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY bit_slice IS
    PORT( a         :IN   STD_LOGIC;
          b         :IN   STD_LOGIC;
          func      :IN   STD_LOGIC(3  DOWNTO 0);
          cin       :IN   STD_LOGIC;
          sin       :IN   STD_LOGIC;
          cout      :OUT  STD_LOGIC;
          sout      :OUT  STD_LOGIC;
          ov        :OUT  STD_LOGIC;
          z         :OUT  STD_LOGIC);
END bit_slice;

ARCHITECTURE instance OF bit_slice IS
BEGIN
        PROCESS ( func , z , cout , sout , a , b , cin , sin)
			       BEGIN
		  IF func="0000" THEN -- manfie B
			z <= not (b)   xor cin;
			cout<=not(b) and cin;                		   
	          ELSIF func="0001" THEN -- A+B (2?s comp Add without carry)
			z <= a XOR b; 
			cout <= a AND b ; 
		        ov <= a AND b ;
                  ELSIF func="0010" THEN -- A+B+Cin (2?s comp Add with carry)
                  	z <= a XOR b XOR cin; 
			cout <= (a AND b) OR (a AND cin) OR (b AND cin);
                  ELSIF func="0011" THEN -- A-B (2?s comp subtraction without carry)
                  	z <= a XOR b; 
			cout <= NOT(a XOR b); 
			ov <= NOT(a) AND b;
                  ELSIF func="0100" THEN -- -B (2?s comp of B)
			z <= not (b)   xor cin;
			cout<=not(b) and cin;      
                  ELSIF func="0101" THEN -- ~B (Bitwise NOT)
                      	z <= not b 
                  ELSIF func="0110" THEN -- A & B (A AND B)
                     	z <= a AND b;
                  ELSIF func="0111" THEN -- A | B (A OR B)
                        z <= a or b;
                  ELSIF func="1000" THEN -- A ^ B (A XOR B)
                      	z <= a xor b;
                  ELSIF func="1001" THEN -- One bit logical left shift of A
                  
                  ELSIF func="1010" THEN -- One bit logical right shift of A
                  
                  ELSIF func="1011" THEN -- One bit circular left shift of A, input bit is sin, output bit is sout
                  
                  ELSIF func="1100" THEN -- One bit circular right shift of A, input bit is sin, output bit is sout
                  
                  ELSIF func="1101" THEN -- Z = 1 if A>B else 0
                  
                  ELSIF func="1110" THEN -- Z = 1 if A<B else 0
                  
                  ELSIF func="1111" THEN -- Z = 1 if A=B else 0
                  
                END IF;			            
			     END PROCESS;  
      
END instance;