--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:18:06 04/06/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_PCADDER.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PCADDER
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
 
ENTITY TB_PCADDER IS
END TB_PCADDER;
 
ARCHITECTURE behavior OF TB_PCADDER IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PCADDER
    PORT(
         IN0 : IN  std_logic_vector(31 downto 0);
         Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IN0 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PCADDER PORT MAP (
          IN0 => IN0,
          Output => Output
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
     IN0 <= x"00001111";
      wait for 10 ns;
   end process;

END;
