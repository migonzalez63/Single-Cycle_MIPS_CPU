LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY less_than_32_tb  IS 
END ; 
 
ARCHITECTURE less_than_32_tb_arch OF less_than_32_tb IS
  SIGNAL A_LT   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL Z_LT   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL B_LT   :  std_logic_vector (31 downto 0)  ; 
  COMPONENT less_than_32  
    PORT ( 
      A_LT  : in std_logic_vector (31 downto 0) ; 
      Z_LT  : out std_logic_vector (31 downto 0) ; 
      B_LT  : in std_logic_vector (31 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : less_than_32  
    PORT MAP ( 
      A_LT   => A_LT  ,
      Z_LT   => Z_LT  ,
      B_LT   => B_LT   ) ; 



-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 A_LT  <= "00000000110101110101111100000010"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 B_LT  <= "01110101110101111100010100010101"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
