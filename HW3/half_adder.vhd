LIBRARY ieee;

	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_ARITH.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY HALF_ADDER IS
	PORT(
		a,b : IN STD_LOGIC;
		S,CO : OUT STD_LOGIC );
	END HALF_ADDER ;
	
	
ARCHITECTURE Behave OF HALF_ADDER is
	begin
			

		s <= (a) xor (b);
		co <= a and b;
	
	end Behave;
