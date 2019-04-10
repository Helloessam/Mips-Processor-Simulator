--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:43:51 04/06/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_AluCtrl.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AluCtrl
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
 
ENTITY TB_AluCtrl IS
END TB_AluCtrl;
 
ARCHITECTURE behavior OF TB_AluCtrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AluCtrl
    PORT(
         Funct : IN  std_logic_vector(5 downto 0);
         Aluop : IN  std_logic_vector(1 downto 0);
         Operation : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Funct : std_logic_vector(5 downto 0) := (others => '0');
   signal Aluop : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Operation : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AluCtrl PORT MAP (
          Funct => Funct,
          Aluop => Aluop,
          Operation => Operation
        );

  

   -- Stimulus process
   stim_proc: process
   begin	
	
   Aluop <= "10";
	Funct <= "100100"; --and
	wait for 20 ns;
	
	Aluop <= "10";
	Funct <= "100101"; --or
	wait for 20 ns;
	
	Aluop <= "10";
	Funct <= "100000"; --add
	wait for 20 ns;
	
	
	Aluop <= "10";
	Funct <= "100010"; --sub
	wait for 20 ns;
	
	Aluop <= "10";
	Funct <= "101010"; --sub
	wait for 20 ns;
	
	-- i type commands 
	-- lw
	Aluop <= "00";
	Funct <= "XXXXXX"; --sub
	wait for 20 ns;
	
	-- sw
	Aluop <= "00";
	Funct <= "XXXXXX"; --sub
	wait for 20 ns;
	
	-- beq
	Aluop <= "01";
	Funct <= "XXXXXX"; --sub
	wait for 20 ns;
	
	
   end process;

END;
