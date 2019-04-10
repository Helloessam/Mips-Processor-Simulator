--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:57:22 04/05/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_Mux.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux
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
 
ENTITY TB_Mux IS
END TB_Mux;
 
ARCHITECTURE behavior OF TB_Mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Sel : IN  std_logic;
         Mux_Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Sel : std_logic := '0';

 	--Outputs
   signal Mux_Output : std_logic_vector(31 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          A => A,
          B => B,
          Sel => Sel,
          Mux_Output => Mux_Output
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
	-- 32 bit 2x1mux
     A <= x"55554444";
	  B <= x"44445555";
	  Sel <= '0';
	  wait for 50 ns;
	  
	  Sel <= '1';
	  wait for 50 ns;
	  
	  Sel <= '0';
	  wait for 50 ns;
	  
	  
   end process;

END;
