LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY inverter_32_tb  IS 
END ; 
 
ARCHITECTURE inverter_32_tb_arch OF inverter_32_tb IS
  SIGNAL num   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL z   :  std_logic_vector (31 downto 0)  ; 
  COMPONENT inverter_32  
    PORT ( 
      num  : in std_logic_vector (31 downto 0) ; 
      z  : out std_logic_vector (31 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : inverter_32  
    PORT MAP ( 
      num   => num  ,
      z   => z   ) ; 



-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 num  <= "00000000000000000000000000010001"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
