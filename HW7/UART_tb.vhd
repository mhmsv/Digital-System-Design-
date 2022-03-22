LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY UART_tb IS END UART_tb ;
ARCHITECTURE test OF UART_tb IS 
    COMPONENT UART IS
    PORT( clk       :  IN  STD_LOGIC;
        nrst      :  IN  STD_LOGIC ;
        tx        :  OUT  STD_LOGIC ;
        start     :  IN  STD_LOGIC ;
        data_in   :  IN  STD_LogiC_VECTOR(7 DOWNTO 0);  
        boud      :  IN  STD_LogiC_VECTOR(7 DOWNTO 0);
        rx        :  IN STD_LOGIC;
        data_ready:  OUT STD_LOGIC;
        data_out  :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
    
    SIGNAL clk_t        : STD_LOGIC := '0';
    SIGNAL nrst_t       : STD_LOGIC;
    SIGNAL tx_u1_to_u2_t: STD_LOGIC;
    SIGNAL rx_u2_to_u1_t: STD_LOGIC;
    SIGNAL start1_t     : STD_LOGIC;
    SIGNAL start2_t     : STD_LOGIC;
    SIGNAL data_in1_t   : STD_LogiC_VECTOR(7 DOWNTO 0):= "00000110";  
    SIGNAL data_in2_t   : STD_LogiC_VECTOR(7 DOWNTO 0):= "00001100";  
    SIGNAL boud_t       : STD_LogiC_VECTOR(7 DOWNTO 0):= "00000011";
    SIGNAL data_ready1_t: STD_LOGIC;
    SIGNAL data_ready2_t: STD_LOGIC;
    SIGNAL data_out1_t   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_out2_t   : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  u1 : UART PORT MAP (clk_t , nrst_t , tx_u1_to_u2_t , start1_t , data_in1_t 
                      , boud_t , rx_u2_to_u1_t , data_ready1_t , data_out1_t);
  u2 : UART PORT MAP (clk_t , nrst_t , rx_u2_to_u1_t , start2_t , data_in2_t 
                      , boud_t , tx_u1_to_u2_t , data_ready2_t , data_out2_t);
  clk_t    <= NOT clk_t AFTER 4 ns;
	nrst_t   <= '0', '1' AFTER 10 ns;
	start1_t <= '0', '1' AFTER 20 ns ;
END test ;