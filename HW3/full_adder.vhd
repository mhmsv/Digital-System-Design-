
LIBRARY IEEE;	

	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_ARITH.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY FULL_ADDER IS
	PORT(
		afa,bfa,cin : IN STD_LOGIC;
		S,CO : OUT STD_LOGIC );
	END FULL_ADDER ;
	
	
	
ARCHITECTURE Behavioural OF FULL_ADDER is
	begin
			
		s <= (afa) xor (bfa) xor (cin);
		co <= (afa and bfa) or (bfa and cin) or (afa and cin);

	end Behavioural;
