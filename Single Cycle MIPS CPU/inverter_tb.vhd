LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY inverter_tb  IS 
END ; 
 
ARCHITECTURE inverter_tb_arch OF inverter_tb IS
  SIGNAL a   :  STD_LOGIC  ; 
  SIGNAL z   :  STD_LOGIC  ; 
  COMPONENT inverter  
    PORT ( 
      a  : in STD_LOGIC ; 
      z  : out STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : inverter  
    PORT MAP ( 
      a   => a  ,
      z   => z   ) ; 



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
END;
