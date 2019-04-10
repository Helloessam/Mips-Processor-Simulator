--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:24:41 04/06/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TestBench_Controller.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Controller
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
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench_Controller IS
END TestBench_Controller;
 
ARCHITECTURE behavior OF TestBench_Controller IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Controller
    PORT(
         OpCode : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         Jump : OUT  std_logic;
         Branch : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemToReg : OUT  std_logic;
         Aluop : OUT  std_logic_vector(1 downto 0);
         MemWrite : OUT  std_logic;
         Alurc : OUT  std_logic;
         RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal OpCode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal Jump : std_logic;
   signal Branch : std_logic;
   signal MemRead : std_logic;
   signal MemToReg : std_logic;
   signal Aluop : std_logic_vector(1 downto 0);
   signal MemWrite : std_logic;
   signal Alurc : std_logic;
   signal RegWrite : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Controller PORT MAP (
          OpCode => OpCode,
          RegDst => RegDst,
          Jump => Jump,
          Branch => Branch,
          MemRead => MemRead,
          MemToReg => MemToReg,
          Aluop => Aluop,
          MemWrite => MemWrite,
          Alurc => Alurc,
          RegWrite => RegWrite
        );

  

   -- Stimulus process
   stim_proc: process
   begin	
	
	OpCode <=  "000000" ; --RType
	wait for 50 ns;
	
	OpCode <=  "100011" ; --LW
	wait for 50 ns;
	
	OpCode <=  "101011" ; --SW
	wait for 50 ns;
	
	OpCode <=  "101011" ; --Beq
	wait for 50 ns;
	
	OpCode <=  "000010" ; --jump
	wait for 50 ns;
	
	OpCode <=  "111111" ; --Unknown
	wait for 50 ns;
	
   end process;

END;
