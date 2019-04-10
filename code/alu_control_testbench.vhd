--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:31:50 02/20/2019
-- Design Name:   
-- Module Name:   F:/mohamed fathy/project/alu_control_testbench.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_control
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
 
ENTITY alu_control_testbench IS
END alu_control_testbench;
 
ARCHITECTURE behavior OF alu_control_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_control
    PORT(
         instruction : IN  std_logic_vector(5 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         operation : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(5 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal operation : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_control PORT MAP (
          instruction => instruction,
          op => op,
          operation => operation
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		op<="00";
		instruction<="000000";
		wait for 20 ns;
		op<="00";
		instruction<="000000";
		wait for 20 ns;
		op<="00";
		instruction<="000000";
		wait for 20 ns;
		op<="00";
		instruction<="000000";
		wait for 20 ns;
		op<="00";
		instruction<="000000";
		wait for 20 ns;
      wait;
   end process;

END;
