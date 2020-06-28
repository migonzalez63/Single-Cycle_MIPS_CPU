LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY registers_tb  IS 
END ; 
 
ARCHITECTURE registers_tb_arch OF registers_tb IS
  SIGNAL write_data   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL read_regi2   :  std_logic_vector (4 downto 0)  ; 
  SIGNAL regi_write   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL read_data1   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  SIGNAL read_data2   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL write_register   :  std_logic_vector (4 downto 0)  ; 
  SIGNAL read_regi1   :  std_logic_vector (4 downto 0)  ; 
  COMPONENT registers  
    PORT ( 
      write_data  : in std_logic_vector (31 downto 0) ; 
      read_regi2  : in std_logic_vector (4 downto 0) ; 
      regi_write  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      read_data1  : out std_logic_vector (31 downto 0) ; 
      reset  : in STD_LOGIC ; 
      read_data2  : out std_logic_vector (31 downto 0) ; 
      write_register  : in std_logic_vector (4 downto 0) ; 
      read_regi1  : in std_logic_vector (4 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : registers  
    PORT MAP ( 
      write_data   => write_data  ,
      read_regi2   => read_regi2  ,
      regi_write   => regi_write  ,
      clk   => clk  ,
      read_data1   => read_data1  ,
      reset   => reset  ,
      read_data2   => read_data2  ,
      write_register   => write_register  ,
      read_regi1   => read_regi1   ) ; 



-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 read_regi1  <= "01001"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 read_regi2  <= "00000"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 write_register  <= "01001"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 write_data  <= "00000000000000000000000000000101"  ;
	wait for 1 ns ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
