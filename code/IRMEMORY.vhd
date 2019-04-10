----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:08 04/04/2019 
-- Design Name: 
-- Module Name:    IRMEMORY - Behavioral 
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
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 
 -- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
 
ENTITY InstructionMemory IS 
  port (   
 		Address  : in  std_logic_vector(31 downto 0); 
 		Instruction : out std_logic_vector(31 downto 0)); 
 END InstructionMemory; 

 architecture Behavioral of InstructionMemory is
	type IRMemorytype  is array (0 to 31)of STD_LOGIC_VECTOR (31 downto 0);
	signal IRMemory : IRMemorytype := 
	--starting from 0x0040 0000 
			(  x"8C090000",  --and t3 t1 t0
				x"01AA6025",	--or t4 t5 t2
				x"01285020",	--add t2 t1 t0
				x"01285022",	--sub t2 t1 t0
				x"0149402A",	--slt t0 t2 t1
				x"082FFFFF",	--beq s0 t2 0X02FFFFF
				x"01285824",	--AND $t3 $t1 $t0
				x"01AA6025",	--OR $t4 $t5 $t2
				x"01285020",	--ADD $t2 $t1 $t0
				x"01285022",	--SUB $t2 $t1 $t0
				x"0149402A",	--SLT $t0 $t2 $t1
				x"120AFFFF",	--BEQ $s0 $t2 0xFFFF
				x"08100000", 	--J 0X02FFFFF
				x"AC0B0000",	--SW $t3 0x0000 $zero
				x"8C090000",	-- lw t1 0x000 $zero
				x"00000000",
				x"01285824",  --and t3 t1 t0
				x"01AA6025",	--or t4 t5 t2
				x"01285020",	--add t2 t1 t0
				x"01285022",	--sub t2 t1 t0
				x"0149402A",	--slt t0 t2 t1
				x"120AFFFF",	--beq s0 t2 0X02FFFFF
				x"01285824",
				x"01AA6025",
				x"01285020",
				x"01285022",
				x"0149402A",
				x"120AFFFF",
				x"08100000", --J 0x0100000
				x"00000000",
				x"00000000",
				x"00000000");
				
	begin
	instruction<= IRmemory(to_integer(unsigned(address)));
 END Behavioral; 