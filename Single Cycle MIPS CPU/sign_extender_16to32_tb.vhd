LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY sign_extender_16to32_tb  IS 
END ; 
 
ARCHITECTURE sign_extender_16to32_tb_arch OF sign_extender_16to32_tb IS
  SIGNAL z   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL a_16   :  std_logic_vector (15 downto 0)  ; 
  COMPONENT sign_extender_16to32  
    PORT ( 
      z  : out std_logic_vector (31 downto 0) ; 
      a_16  : in std_logic_vector (15 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : sign_extender_16to32  
    PORT MAP ( 
      z   => z  ,
      a_16   => a_16   ) ; 



-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 a_16  <= "0000001101101101"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
