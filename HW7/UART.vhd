Library ieee; 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
--S2P ersal konnde
--P2S daryaft konnde
ENTITY UART IS
  PORT( clk       :  IN  STD_LOGIC;
        nrst      :  IN  STD_LOGIC ;
        tx        :  OUT  STD_LOGIC ;
        start     :  IN  STD_LOGIC ;
        data_in   :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  
        boud      :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        rx        :  IN STD_LOGIC;
        data_ready:  OUT STD_LOGIC;
        data_out  :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END UART;

ARCHITECTURE moore_state_machin OF UART IS
	-- cnt_b : ta adade bud mire va vaghti raf adade cnt yeki ziyad mishe(clock chandome boudim)
	-- cnt : count of buds of sending 8bit data_in
	--------------P2S signals
  TYPE STATE IS (s0, s1, s2, s3 , s4);
  SIGNAL nxt_state , cur_state  : STATE   := s0;
  SIGNAL cur_cnt, nxt_cnt       : INTEGER := 0 ;
  SIGNAL cur_cntb, nxt_cntb     : INTEGER := 0 ;
  SIGNAL parity ,parity_s       : STD_LOGIC ;
  SIGNAL total_boud             : INTEGER := 0 ; --             kolle boud ha ro mishmore (gozashtane tx=0 + ferestadane 8 bit data + 
                                                 --             ferestadane parrity + daryafte parity samte moqabel az rx)  = 11 boud
  
  --------------S2P signals
  TYPE STATE2 IS (s0, s1 , s2 , s3);
  SIGNAL nxt_state2 , cur_state2  : STATE2  := s0;
  SIGNAL cur_cnt2, nxt_cnt2       : INTEGER := 0;
  SIGNAL cur_cntb2, nxt_cntb2     : INTEGER := 0;
  SIGNAL data_out_t               : STD_LOGIC_VECTOR(7 DOWNTO 0);
  BEGIN
    
  ---seq process for switching between states  
  events:PROCESS(clk, nrst)
  BEGIN
    IF nrst = '0' THEN
      --P2S reset states
      cur_state  <= s0;
      cur_cnt    <= 0;
      cur_cntb   <= 0;
      --S2P reset states
      cur_state2 <= s0;
      cur_cnt2   <= 0;
      cur_cntb2  <= 0;
    ELSIF rising_edge(clk) THEN
      --P2S next states and handle events
      cur_state  <= nxt_state;
      cur_cnt    <= nxt_cnt;
      cur_cntb   <= nxt_cntb;
      --S2P next states and handle events
      cur_state2 <= nxt_state2;
      cur_cnt2   <= nxt_cnt2;
      cur_cntb2  <= nxt_cntb2;
    END IF;
  END PROCESS events;
  
  --P2S comibinational 
  P2S:PROCESS(cur_state, start,cur_cnt,cur_cntb)
  BEGIN
    ------ S0 --------
    IF cur_state = s0 THEN
      nxt_cnt  <= 0;
      nxt_cntb <= 0;
      tx       <= '1'; --1 bashe yane nafrestadim va montazere
      
      IF start = '1' THEN
        nxt_state <= s1;
      ELSE
        nxt_state <= s0;
      END IF;
    ------ S1 -------- 
    ELSIF cur_state = s1 THEN
      nxt_cnt <= 0;
      tx      <= '0';
      IF cur_cntb = to_integer(unsigned(boud)) - 1 THEN
        nxt_state <= s2;
        nxt_cntb  <= 0;
        total_boud<= 1 ;
      ELSE
        nxt_state <= s1;
        nxt_cntb  <= cur_cntb +  1;
      END IF;
      
    ------ S2 --------
    ELSIF cur_state = s2 THEN
      IF cur_cnt = 7 THEN
        IF cur_cntb = to_integer(unsigned(boud)) - 1 THEN
          total_boud<= total_boud + 1 ;
          nxt_state <= s3;
          tx        <= data_in(cur_cnt);
          nxt_cnt   <= 0;
          nxt_cntb  <= 0;
        ELSE
          nxt_state <= s2;
          tx        <= data_in(cur_cnt);
          nxt_cnt   <= cur_cnt;
          nxt_cntb  <= cur_cntb + 1;
        END IF;
      ELSE
        IF cur_cntb = to_integer(unsigned(boud)) - 1 THEN
          nxt_state <= s2;
          tx        <= data_in(cur_cnt);
          nxt_cnt   <= cur_cnt +1 ;
          nxt_cntb  <= 0;
          total_boud<= total_boud + 1 ;
        ELSE
          nxt_state <= s2;
          tx        <= data_in(cur_cnt);
          nxt_cnt   <= cur_cnt;
          nxt_cntb  <= cur_cntb + 1;
        END IF;
      END IF;
      
    ------ S3 --------
    -- parity e data ro hesab mikonim mizarim roo tx , ba ye boud mifrestim mire oun samte dge 
    ELSIF cur_state = s3 THEN
      parity <= data_in(0) XOR data_in(1) XOR data_in(2) XOR data_in(3) XOR data_in(4) XOR data_in(5) XOR
                data_in(6) XOR data_in(7) ;
                
      IF cur_cntb = to_integer(unsigned(boud)) - 1 THEN
        nxt_state <= s4;
        tx        <= parity ;
        total_boud<= total_boud + 1 ;--10 boud ta alan
        nxt_cntb  <= 0 ;
        
      ELSE
        nxt_state <= s3;
        tx        <=  parity ;
        nxt_cntb  <= cur_cntb + 1;
        
      END IF;
   
    ------ S4 --------
    -- samte moqabel check mikone parity ha ro va age motafavet boodan roo rx , 0 minevise va mifreste in samt
    ELSE
      IF cur_cntb = to_integer(unsigned(boud)) - 1 THEN
        nxt_cntb  <= 0 ;
        total_boud<= 0 ;--11 boud ta alan dashtim k karemoon ba moafaghiat tamoom shod va sefresh kardim
        IF rx = '0' THEN
          nxt_state <= s0; -- ersale mojdd e dade
        ELSE
          nxt_state <= s4; -- etmame kar??
        END IF;

      ELSE
        nxt_state <= s4;
        tx        <=  parity ;
        nxt_cntb  <= cur_cntb + 1;
        
      END IF;
    END IF;  
  END PROCESS P2S;  


S2P:PROCESS(cur_state2, rx, cur_cnt2, cur_cntb2)
	BEGIN
	  
	  ------ S0 --------
	  IF cur_state2 = s0 THEN
      data_ready<= '0';
      nxt_cnt2  <= 0;
      nxt_cntb2 <= 0;
      IF rx = '1' THEN
        nxt_state2 <= s0;
      ELSE
        IF cur_cntb2 = to_integer(unsigned(boud)) - 1 THEN
          nxt_state2 <= s1;
          nxt_cntb2  <= 0;
        ELSE
          nxt_state2 <= s0;
          nxt_cntb2  <= cur_cntb2 +  1;
        END IF;
      END IF;
      
    ------ S1 --------
    ELSIF cur_state2 = s1 THEN
      IF cur_cnt2 = 7 THEN
        IF cur_cntb2 = to_integer(unsigned(boud)) THEN
          nxt_state2         <= s2;
          data_out_t(cur_cnt2) <= rx;
          data_out(cur_cnt2) <= data_out_t(cur_cnt2);
          nxt_cnt2           <= 0;
          nxt_cntb2          <= 0;
        ELSE
          nxt_state2         <= s1;
          data_out_t(cur_cnt2) <= rx;
          data_out(cur_cnt2) <= data_out_t(cur_cnt2);
          nxt_cnt2           <= cur_cnt2;
          nxt_cntb2          <= cur_cntb2 + 1;
        END IF;
      ELSE
        IF cur_cntb2 = to_integer(unsigned(boud)) - 1 THEN
          nxt_state2         <= s1;
          data_out_t(cur_cnt2) <= rx;
          data_out(cur_cnt2) <= data_out_t(cur_cnt2);
          nxt_cnt2           <= cur_cnt2 + 1;
          nxt_cntb2          <= 0;
        ELSE
          nxt_state2         <= s1;
          data_out_t(cur_cnt2) <= rx;
          data_out(cur_cnt2) <= data_out_t(cur_cnt2);
          nxt_cnt2           <= cur_cnt2;
          nxt_cntb2          <= cur_cntb2 + 1;
        END IF;
      END IF;
    ------ S2 --------
    ELSIF cur_state2 = s2 THEN                 
      IF cur_cntb2 = to_integer(unsigned(boud)) - 1 THEN
        nxt_state2 <= s3;
        parity <=  rx ;
        nxt_cntb2  <= 0 ;
        
      ELSE
        nxt_state2 <= s2;
        parity <=  rx ;
        nxt_cntb2  <= cur_cntb2 + 1;
    END IF ;
    ------ S3 --------     
    ELSE
      parity_s <= data_out_t(0) XOR data_out_t(1) XOR data_out_t(2) XOR data_out_t(3) XOR data_out_t(4)
                  XOR data_out_t(5) XOR data_out_t(6) XOR data_out_t(7) ;
      IF parity = parity_s THEN
        data_ready <= '1' ;
      ELSE
        tx <= '0';
      END IF;
      
    END IF;
	END PROCESS S2P;
END moore_state_machin ;