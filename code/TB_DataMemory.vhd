--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:45:15 04/05/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_DataMemory.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMemory
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
 
ENTITY TB_DataMemory IS
END TB_DataMemory;
 
ARCHITECTURE behavior OF TB_DataMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         MemoryRead : IN  std_logic;
         MemoryWrite : IN  std_logic;
         ReadData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal MemoryRead : std_logic := '0';
   signal MemoryWrite : std_logic := '0';

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          Address => Address,
          WriteData => WriteData,
          MemoryRead => MemoryRead,
          MemoryWrite => MemoryWrite,
          ReadData => ReadData
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
   Address <= x"10010000";
	WriteData <= x"11112222";
	MemoryWrite <= '0';
	wait for 10 ns;
	MemoryWrite <= '1';
	wait for 10 ns;
	MemoryWrite <= '0';
	wait for 10 ns;
	
	Address <= x"10010004";
	WriteData <= x"33334444";
	MemoryWrite <= '0';
	wait for 10 ns;
	MemoryWrite <= '1';
	wait for 10 ns;
	MemoryWrite <= '0';
	wait for 10 ns;
	
	--read 2 memory locations 
	
	Address <= x"10010000";
	MemoryRead <= '0';
	wait for 10 ns;
	MemoryRead <= '1';
	wait for 10 ns;
	MemoryRead <= '0';
	wait for 10 ns;
	
	Address <= x"10010004";
	MemoryRead <= '0';
	wait for 10 ns;
	MemoryRead <= '1';
	wait for 10 ns;
	MemoryRead <= '0';
	wait for 10 ns;
   end process;

END;
