--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:24:02 04/06/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_AND.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: And2to1
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
 
ENTITY TB_AND IS
END TB_AND;
 
ARCHITECTURE behavior OF TB_AND IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT And2to1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         OP : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal OP : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: And2to1 PORT MAP (
          A => A,
          B => B,
          OP => OP
        );

   -- Stimulus process
   stim_proc: process
   begin		
      A <='1';
		B<='1';
		wait for 10 ns ;
   end process;

END;
