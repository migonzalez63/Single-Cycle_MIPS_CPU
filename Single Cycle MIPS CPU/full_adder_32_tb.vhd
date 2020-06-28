LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY full_adder_32_tb  IS 
END ; 
 
ARCHITECTURE full_adder_32_tb_arch OF full_adder_32_tb IS
  SIGNAL carry_out   :  STD_LOGIC  ; 
  SIGNAL sum   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL a   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL b   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL carry_in   :  STD_LOGIC  ; 
  COMPONENT full_adder_32  
    PORT ( 
      carry_out  : out STD_LOGIC ; 
      sum  : out std_logic_vector (31 downto 0) ; 
      a  : in std_logic_vector (31 downto 0) ; 
      b  : in std_logic_vector (31 downto 0) ; 
      carry_in  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : full_adder_32  
    PORT MAP ( 
      carry_out   => carry_out  ,
      sum   => sum  ,
      a   => a  ,
      b   => b  ,
      carry_in   => carry_in   ) ; 



-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 a  <= "00000000000000000000000101100101"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 b  <= "11111111111111111111111111000110"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  Process
	Begin
	 carry_in  <= '0'  ;
	wait for 50 ps ;
-- 50 ps, single loop till start period.
	for Z in 1 to 9
	loop
	    carry_in  <= '1'  ;
	   wait for 50 ps ;
	    carry_in  <= '0'  ;
	   wait for 50 ps ;
-- 950 ps, repeat pattern in loop.
	end  loop;
	 carry_in  <= '1'  ;
	wait for 50 ps ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
