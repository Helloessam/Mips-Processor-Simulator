--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:49:35 04/05/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/InstructioMemory_TestBench.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InstructionMemory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY InstructioMemory_TestBench IS
END InstructioMemory_TestBench;
 
ARCHITECTURE behavior OF InstructioMemory_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := x"003FFFFC";

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          Address => Address,
          Instruction => Instruction
        );


   -- Stimulus process
   stim_proc: process
   begin		
     for I in 0 to 11 loop 
	  Address <=x"00400000" or std_logic_vector (to_unsigned(I*4,32));
	  wait for 25 ns;
	  end loop;
   end process;

END;
