LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY Instruction_mem_tb  IS 
END ; 
 
ARCHITECTURE Instruction_mem_tb_arch OF Instruction_mem_tb IS
  SIGNAL instruction   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL addr   :  std_logic_vector (31 downto 0)  ; 
  COMPONENT instr_mem  
    PORT ( 
      instruction  : out std_logic_vector (31 downto 0) ; 
      addr  : in std_logic_vector (31 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : instr_mem  
    PORT MAP ( 
      instruction   => instruction  ,
      addr   => addr   ) ; 



-- "Counter Pattern"(Range-Up) : step = 1 Range(00000000000000000000000000000000-00000000000000000000000000101000)
-- Start Time = 0 ps, End Time = 1 ns, Period = 50 ps
  Process
	variable VARaddr  : std_logic_vector (31 downto 0);
	Begin
	VARaddr  := "00000000000000000000000000000000" ;
	for repeatLength in 1 to 20
	loop
	    addr  <= VARaddr  ;
	   wait for 50 ps ;
	   VARaddr  := VARaddr  + 1 ;
	end loop;
-- 1 ns, periods remaining till edit start time.
	wait;
 End Process;
END;
