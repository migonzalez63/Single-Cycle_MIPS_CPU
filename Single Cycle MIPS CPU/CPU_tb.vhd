LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY CPU_tb  IS 
END ; 
 
ARCHITECTURE CPU_tb_arch OF CPU_tb IS
  SIGNAL ALU_result   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL PC_out   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL Instruction   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL main_clk   :  STD_LOGIC  ; 
  SIGNAL main_reset   :  STD_LOGIC  ; 
  COMPONENT CPU  
    PORT ( 
      ALU_result  : out std_logic_vector (31 downto 0) ; 
      PC_out  : out std_logic_vector (31 downto 0) ; 
      Instruction  : out std_logic_vector (31 downto 0) ; 
      main_clk  : in STD_LOGIC ; 
      main_reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : CPU  
    PORT MAP ( 
      ALU_result   => ALU_result  ,
      PC_out   => PC_out  ,
      Instruction   => Instruction  ,
      main_clk   => main_clk  ,
      main_reset   => main_reset   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 us, Period = 100 ps
  Process
	Begin
	for Z in 1 to 10000
	loop
	    main_clk  <= '1'  ;
	   wait for 50 ps ;
	    main_clk  <= '0'  ;
	   wait for 50 ps ;
-- 1 us, repeat pattern in loop.
	end  loop;
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  Process
	Begin
	for Z in 1 to 10
	loop
	    main_reset  <= '1'  ;
	   wait for 50 ps ;
	    main_reset  <= '0'  ;
	   wait for 50 ps ;
-- 1 ns, repeat pattern in loop.
	end  loop;
	wait;
 End Process;
END;
