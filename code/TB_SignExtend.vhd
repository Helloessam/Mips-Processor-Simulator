--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:11:10 04/05/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_SignExtend.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SignExtend
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
 
ENTITY TB_SignExtend IS
END TB_SignExtend;
 
ARCHITECTURE behavior OF TB_SignExtend IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SignExtend
    PORT(
         input : IN  std_logic_vector(15 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SignExtend PORT MAP (
          input => input,
          output => output
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
    input <= x"7AAA";
	 wait for 50 ns;
	 
	 input <= x"8000";
	 wait for 50 ns;
	 
	 input <= x"FFFF";
	 wait for 50 ns;
	 
	 end process;

END;
