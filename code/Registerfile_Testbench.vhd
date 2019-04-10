--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:47:47 03/07/2019
-- Design Name:   
-- Module Name:   D:/Users/AAST-7/Desktop/project/Registerfile_Testbench.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Registerfile
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
USE ieee.numeric_std.ALL;
 
ENTITY Registerfile_Testbench IS
END Registerfile_Testbench;
 
ARCHITECTURE behavior OF Registerfile_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Registerfile
    PORT(
         Read_reg_1 : IN  std_logic_vector(4 downto 0);
         Read_reg_2 : IN  std_logic_vector(4 downto 0);
         Write_reg : IN  std_logic_vector(4 downto 0);
         Write_data : IN  std_logic_vector(31 downto 0);
         WriteEnable : IN  std_logic;
         Read_data_1 : OUT  std_logic_vector(31 downto 0);
         Read_data_2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Read_reg_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Read_reg_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Write_reg : std_logic_vector(4 downto 0) := (others => '0');
   signal Write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteEnable : std_logic := '0';

 	--Outputs
   signal Read_data_1 : std_logic_vector(31 downto 0);
   signal Read_data_2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Registerfile PORT MAP (
          Read_reg_1 => Read_reg_1,
          Read_reg_2 => Read_reg_2,
          Write_reg => Write_reg,
          Write_data => Write_data,
          WriteEnable => WriteEnable,
          Read_data_1 => Read_data_1,
          Read_data_2 => Read_data_2
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
	-- reading all of the 32 registers
		--for I in 0 TO 30 loop
		--Read_reg_1 <= std_logic_vector(to_unsigned(I,5));
		--Read_reg_2 <= std_logic_vector(to_unsigned(I+1,5));
      --wait for 50 ns;
		--end loop;
	-- writing a register 
	Write_reg <= "01000";
	Write_data <= x"A3A3A3A3";
	wait for 50 ns;
	
	WriteEnable <= '1';
	wait for 5 ns;
	WriteEnable <= '0';
	wait for 5 ns;
	
   end process;
END;
