LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY full_adder_tb  IS 
END ; 
 
ARCHITECTURE full_adder_tb_arch OF full_adder_tb IS
  SIGNAL carry_out   :  STD_LOGIC  ; 
  SIGNAL sum   :  STD_LOGIC  ; 
  SIGNAL a   :  STD_LOGIC  ; 
  SIGNAL b   :  STD_LOGIC  ; 
  SIGNAL carry_in   :  STD_LOGIC  ; 
  COMPONENT full_adder  
    PORT ( 
      carry_out  : out STD_LOGIC ; 
      sum  : out STD_LOGIC ; 
      a  : in STD_LOGIC ; 
      b  : in STD_LOGIC ; 
      carry_in  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : full_adder  
    PORT MAP ( 
      carry_out   => carry_out  ,
      sum   => sum  ,
      a   => a  ,
      b   => b  ,
      carry_in   => carry_in   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 200 ps
  Process
	Begin
	for Z in 1 to 5
	loop
	    carry_in  <= '1'  ;
	   wait for 100 ps ;
	    carry_in  <= '0'  ;
	   wait for 100 ps ;
-- 1 ns, repeat pattern in loop.
	end  loop;
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  Process
	Begin
	for Z in 1 to 10
	loop
	    a  <= '1'  ;
	   wait for 50 ps ;
	    a  <= '0'  ;
	   wait for 50 ps ;
-- 1 ns, repeat pattern in loop.
	end  loop;
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 50 ps
  Process
	Begin
	for Z in 1 to 20
	loop
	    b  <= '1'  ;
	   wait for 25 ps ;
	    b  <= '0'  ;
	   wait for 25 ps ;
-- 1 ns, repeat pattern in loop.
	end  loop;
	wait;
 End Process;
END;
