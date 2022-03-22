
LIBRARY ieee;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_ARITH.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

	
ENTITY ML32 IS
	PORT(
		NUM1,NUM2 : IN STD_LOGIC_VECTOR(31 downto 0);
		RESULT : OUT STD_LOGIC_VECTOR(63 DOWNTO 0) );
	END ML32 ;

ARCHITECTURE BEHAVE OF ML32 IS
		SUBTYPE bitArray IS std_logic_vector(31 DOWNTO 0);
    		TYPE pedargrid IS ARRAY(0 TO 31) OF bitArray;
		signal sums,carries,ZARBIJ : pedargrid;
		signal mahtab : std_logic;

		component HALF_ADDER_c port (
		a,b : IN STD_LOGIC;
		S,CO : OUT STD_LOGIC );
		end component;

		component FULL_ADDER_c port (
		afa,bfa,cin : IN STD_LOGIC;
		S,CO : OUT STD_LOGIC );
		end component;

	BEGIN
		SAKHTANajbi: for i in 1 to 31 generate 
			darj :	for j in 0 to 30 generate
					zarbij(i)(j) <= (num1(j) and num2(i));
		end generate;
		end generate;

		khatavalDARsums: for j in 1 to 31 generate
			sums(0)(j) <= num1(j) and num2(0);
			end generate;
		result(0)<= zarbij(0)(0);


		HALFADDER_FILLING: FOR j IN 0 to 30 GENERATE
			mahtab <= (NUM1(0) and NUM2(j+1));
			ha : HALF_ADDER_c port map(
			a =>zarbij(1)(j),
			b => mahtab,
			s => sums(1)(j),
			co => carries(1)(j)
					);
		end generate;

		result(1)<=sums(1)(0);
		
		fulladder_filling : for i in 2 to 31 generate
					j:for j in 0 to 30 generate 
				fa : full_adder_c port map (
				afa=>zarbij(i)(j),
				bfa=>sums(i-1)(j+1),
				cin => carries(i-1)(j),
				S=>sums(i)(j),
				CO =>carries(i)(j) 
				);	
		end generate;
			onkemiparebironkharejmishe: result(i)<= sums(i)(0);
		end generate;


		khatAKHARchap: for i in 0 to 31 generate
			sums(i)(31) <= num1(31) and num2(i);
		end generate;

		farastiha : full_adder_c port map (
				afa=>'0',
				bfa=>carries(30)(0),
				cin =>sums(30)(1),
				S=>sums(31)(0),
				CO =>carries(31)(0) 
				);
	
				fulladder_akharo: for j in 1 to 30 generate
		faradifakhar : full_adder_c port map (
				afa=>carries(31)(j-1),
				bfa=>carries(30)(j),
				cin =>sums(30)(j+1),
				S=>sums(31)(j),
				CO =>carries(31)(j) 
				);	
			end generate;
    			result(63) <= carries(31)(30);
		   lastRowsResult : for j IN 1 TO 30 generate
      		  result(31 + j - 1) <= sums(31)(j - 1);
    			END GENERATE;
	
	END BEHAVE;
