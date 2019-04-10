--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:13:41 04/05/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_IAlu.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IAlu
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
 
ENTITY TB_IAlu IS
END TB_IAlu;
 
ARCHITECTURE behavior OF TB_IAlu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IAlu
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         AluCtrl : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal AluCtrl : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic_vector(31 downto 0);
   signal zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IAlu PORT MAP (
          A => A,
          B => B,
          AluCtrl => AluCtrl,
          Output => Output,
          zero => zero
        );

 

   -- Stimulus process
   stim_proc: process
   begin	
		A <= x"00000003";
		B <= x"FFFFFFFF";
   AluCtrl <= "0000"; --And
	wait for 50 ns;
	
	AluCtrl <= "0001"; --OR
	wait for 50 ns;
	
	AluCtrl <= "0010"; --ADD
	wait for 50 ns;
	
	AluCtrl <= "0110"; --SUB
	wait for 50 ns;
	
	AluCtrl <= "0111"; --STL
	wait for 50 ns;
	
	AluCtrl <= "1100"; --NOR
	wait for 50 ns;

   end process;

END;
