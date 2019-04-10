--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:26:24 04/06/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_PC.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Pcounter
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
 
ENTITY TB_PC IS
END TB_PC;
 
ARCHITECTURE behavior OF TB_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Pcounter
    PORT(
         NextAddress : IN  std_logic_vector(31 downto 0);
         CurrentAddress : OUT  std_logic_vector(31 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal NextAddress : std_logic_vector(31 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal CurrentAddress : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Pcounter PORT MAP (
          NextAddress => NextAddress,
          CurrentAddress => CurrentAddress,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		NextAddress <= x"00000000";
		wait for  50 ns;
		NextAddress <= x"00000004";
		wait for 50 ns;
		NextAddress <= x"00000008";
		wait for 50 ns;
		NextAddress <= x"0000000c";
		wait for 50 ns;
		NextAddress <= x"FFFFFFF0";
		wait for 50 ns;
   end process;

END;
