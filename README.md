# team07

Gonzalez, Miguel Angel <migonzalez@unm.edu>

Constructs a Single-Cycle MIPS CPU that executes the following instructions:
* Addition
* Subtraction
* Logical and
* Logical or
* Logical nor
* Set Less Than
* Add Immediate 
* Save Word
* Load Word
* Branch on Equal
* Jump

Lab 2 will contains the entire project, since I wasn't exactly sure what files 
were necessary in order for the project to run. Should be able to copy folder and 
open in Xilinx ISE to view project.

Most of the naming convention is followed to meet the instructions, but a few
have been modified in order to make it easier to read and understand.

Included you will also find a PDF called Part1 1 bit Full Adder, which contains
a truth table and schematics to build a 1 bit adder, just like the lab requested.


## Part 1
* full_adder takes a 1 bit adder and iterated through it 32 times, 1 for each bit.

* inverter_32 takes a 32 bit number input, inverts it, and uses the full adder to
  add 1 to it, in order to get the input's 2's complement

* sign_extender_32_to_16 takes a 16 bit input and concatonates the remaining 16
  to the front depending on the sign bit of the 16 bit input. 

## Part 2
* ALU includes the full adder, inverter, and sign extender in part 1, and uses those
  components to build some of the operators specified in the lab, such as, add, sub,
  and set less than. 

* Also included are 3 new components, ADD_32, OR_32, and NOR_32, which provides
  the and, or, and nor logical operators for 32 bit inputs.

## Part 3 
* Data Memory was given by the instructor, but Instruction Memory and Register File
  were influenced by the structure that Data Memory was built upon. 

* Instruction Memory builds an array to store the instructions on. Since the PC
  that the CPU will use is being incremented by 4 every time, this means that
  the instructions must be inputed in sizes of 8 bits, thus a full 32 bit word instruction
  will be seperated into 4 bytes. Thus the size of the array must be a multiple
  of 4 for the implementation to work properly.

* Register File builds an array of size 32 that holds all 32 registers defined
  by MIPS. Each cell in the array can hold a 32 bit word. Since we do not use the
  PC to access the registers, this can actually be the full register word. Will also
  write data back into specified register if the appropiate signal is given.

## Part 4
* Defines new components control_unit, ALU_control, and Multiplexer_2to1.

* control_unit is the main control of the CPU that reads the opcode of the instruction
  and sets the appropiate signals to properly execute the instruction.

* ALU_control is the ALU controller for the ALU that will set it to perform the
  appropiate opertaion depending on the instructions funct code and ALUOp code 
  sent by the control_unit

* Multiplexer_2to1 will allow the CPU decide what signal to actually pass along
  in order to have the proper data. Multiplexers will determine output by the signal
  sent by the main control unit.