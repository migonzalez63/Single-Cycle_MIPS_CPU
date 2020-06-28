----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:40 03/07/2019 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- The Main Control Unit for the CPU. Will let the components know what 
-- to do on each instruction
entity control_unit is
    Port ( opcode : in  STD_LOGIC_VECTOR (5 downto 0);
			  reset: in STD_LOGIC;
           RegDst : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is

begin

	process(opcode, reset)
		begin
			if (reset = '1') then -- Resets all values to zero
				RegDst <= '0';
				Jump <= '0';
				Branch <= '0';
				MemRead <= '0';
				MemtoReg <= '0';
				ALUOp <= "00";
				MemWrite <= '0';
				ALUSrc <= '0';
				RegWrite <= '0';
			else
				case opcode is
					when "000000" =>-- R-type Instruction
						RegDst <= '1'; -- Has a dest register
						Jump <= '0';
						Branch <= '0';
						MemRead <= '0';
						MemtoReg <= '0';
						ALUOp <= "10"; -- specefied by book
						MemWrite <= '0';
						ALUSrc <= '0';
						RegWrite <= '1'; -- Need to put answer in register
					when "100011" =>-- Load Word
						RegDst <= '0';
						Jump <= '0';
						Branch <= '0';
						MemRead <= '1'; -- Reads content from memory
						MemtoReg <= '1'; -- Puts content in a register
						ALUOp <= "00";
						MemWrite <= '0';
						ALUSrc <= '1'; -- Need to do operation on immediate
						RegWrite <= '1';
					when "101011" => -- Store Word
						RegDst <= '0';
						Jump <= '0';
						Branch <= '0';
						MemRead <= '0'; 
						MemtoReg <= '0';
						ALUOp <= "00";
						MemWrite <= '1'; -- Writes contents of register to memory
						ALUSrc <= '1'; -- Need to do operation on immediate
						RegWrite <= '0';
					when "000100" => -- Branch on Equal
						RegDst <= '0';
						Jump <= '0';
						Branch <= '1'; -- Branch Flag
						MemRead <= '0'; -- Reads content from memory
						MemtoReg <= '0'; 
						ALUOp <= "01";
						MemWrite <= '0';
						ALUSrc <= '0';
						RegWrite <= '0';
					when "000010" => -- Jump
						RegDst <= '0';
						Jump <= '1'; -- Performs jumo
						Branch <= '0';
						MemRead <= '0'; 
						MemtoReg <= '0'; 
						ALUOp <= "00";
						MemWrite <= '0';
						ALUSrc <= '0';
						RegWrite <= '0';
					when others => -- Add Immediate
						RegDst <= '0';
						Jump <= '0';
						Branch <= '0';
						MemRead <= '0'; 
						MemtoReg <= '0';
						ALUOp <= "00";
						MemWrite <= '0';
						ALUSrc <= '1'; -- Need to do operation on immediate
						RegWrite <= '1'; -- Write back to register 
				end case;
			end if;
	end process;	
end Behavioral;

