--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:52:45 02/06/2019
-- Design Name:   
-- Module Name:   D:/Users/AAST-7/Desktop/mohamed fathy/project/Mux4to1_tb.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux4to1
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
 
ENTITY Mux4to1_tb IS
END Mux4to1_tb;
 
ARCHITECTURE behavior OF Mux4to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4to1
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C : IN  std_logic_vector(31 downto 0);
         D : IN  std_logic_vector(31 downto 0);
         Z : OUT  std_logic_vector(31 downto 0);
         sel : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal C : std_logic_vector(31 downto 0) := (others => '0');
   signal D : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4to1 PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          Z => Z,
          sel => sel
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		A<="00000000000000000000000000000100";
		B<="00000000000000000000000000000101";
		C<="00000000000000000000000000000110";
		D<="00000000000000000000000000000111";
		sel<="00";
		wait for 100 ns;
		sel<="01";
		wait for 100 ns;
		sel<="10";
      wait;
   end process;

END;
