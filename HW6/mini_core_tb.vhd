LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY mini_core_tb IS END mini_core_tb;
ARCHITECTURE test OF mini_core_tb IS
	COMPONENT mini_core IS	
		PORT(
			clk 	: IN std_logic;
			nrst 	: IN std_logic;
			opcode 	: IN std_logic_vector(2 DOWNTO 0)
		);
	END COMPONENT;
	SIGNAL clk_t 	: std_logic := '0';
	SIGNAL nrst_t 	: std_logic;
	SIGNAL opcode_t 		: std_logic_vector(2 DOWNTO 0);
BEGIN
	u1 : mini_core PORT MAP (clk_t, nrst_t, opcode_t);
	clk_t <= NOT clk_t AFTER 10 ns;
	nrst_t <= '0', '1' AFTER 35 ns;
	opcode_t <= "000",
	            
	            "010" AFTER 280 ns,
	            "011" AFTER 420 ns,
	            "100" AFTER 560 ns,
	            "101" AFTER 700 ns,
	            "110" AFTER 840 ns,
	            "111" AFTER 980 ns,
	            "001" AFTER 140 ns;
END test;
