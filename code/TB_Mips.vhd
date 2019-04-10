--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:29:17 04/06/2019
-- Design Name:   
-- Module Name:   C:/Users/atlas/Desktop/project/TB_Mips.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MIPS
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
 
ENTITY TB_Mips IS
END TB_Mips;
 
ARCHITECTURE behavior OF TB_Mips IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MIPS
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         out_CurrentAddressop : OUT  std_logic_vector(31 downto 0);
         out_IRmemop : OUT  std_logic_vector(31 downto 0);
         out_RegDstop : OUT  std_logic;
         out_Jumpop : OUT  std_logic;
         out_Branchop : OUT  std_logic;
         out_MemReadop : OUT  std_logic;
         out_MemToRegop : OUT  std_logic;
         out_AluopOP : OUT  std_logic_vector(1 downto 0);
			out_concatenate: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         out_MemWriteop : OUT  std_logic;
         out_Alurcop : OUT  std_logic;
         out_RegWriteop : OUT  std_logic;
         out_Read_data_1op : OUT  std_logic_vector(31 downto 0);
         out_Read_data_2op : OUT  std_logic_vector(31 downto 0);
         out_AluResultop : OUT  std_logic_vector(31 downto 0);
         out_zeroOp : OUT  std_logic;
         out_Operationop : OUT  std_logic_vector(3 downto 0);
         out_ReadDataop : OUT  std_logic_vector(31 downto 0);
         out_AdderOutputop : OUT  std_logic_vector(31 downto 0);
         out_PcAdderOutputop : OUT  std_logic_vector(31 downto 0);
         out_shiftreg1op : OUT  std_logic_vector(31 downto 0);
         out_shiftreg2op : OUT  std_logic_vector(31 downto 0);
         out_DMMux_OutputOp : OUT  std_logic_vector(31 downto 0);
         out_D2Mux_OutputOp : OUT  std_logic_vector(31 downto 0);
         out_D1Mux_OutputOp : OUT  std_logic_vector(31 downto 0);
         out_intoregMux_OutputOp : OUT  std_logic_vector(4 downto 0);
         out_intoAlugMux_OutputOp : OUT  std_logic_vector(31 downto 0);
         out_SignExoutput : OUT  std_logic_vector(31 downto 0);
         out_andop : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal out_CurrentAddressop : std_logic_vector(31 downto 0);
   signal out_IRmemop : std_logic_vector(31 downto 0);
   signal out_RegDstop : std_logic;
   signal out_Jumpop : std_logic;
   signal out_Branchop : std_logic;
   signal out_MemReadop : std_logic;
   signal out_MemToRegop : std_logic;
   signal out_AluopOP : std_logic_vector(1 downto 0);
   signal out_MemWriteop : std_logic;
   signal out_Alurcop : std_logic;
   signal out_RegWriteop : std_logic;
   signal out_Read_data_1op : std_logic_vector(31 downto 0);
   signal out_Read_data_2op : std_logic_vector(31 downto 0);
   signal out_AluResultop : std_logic_vector(31 downto 0);
   signal out_zeroOp : std_logic;
   signal out_Operationop : std_logic_vector(3 downto 0);
   signal out_ReadDataop : std_logic_vector(31 downto 0);
   signal out_AdderOutputop : std_logic_vector(31 downto 0);
   signal out_PcAdderOutputop : std_logic_vector(31 downto 0);
   signal out_shiftreg1op : std_logic_vector(31 downto 0);
   signal out_shiftreg2op : std_logic_vector(31 downto 0);
   signal out_DMMux_OutputOp : std_logic_vector(31 downto 0);
   signal out_D2Mux_OutputOp : std_logic_vector(31 downto 0);
   signal out_D1Mux_OutputOp : std_logic_vector(31 downto 0);
   signal out_intoregMux_OutputOp : std_logic_vector(4 downto 0);
   signal out_intoAlugMux_OutputOp : std_logic_vector(31 downto 0);
   signal out_SignExoutput : std_logic_vector(31 downto 0);
   signal out_andop : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MIPS PORT MAP (
          Clk => Clk,
          Reset => Reset,
          out_CurrentAddressop => out_CurrentAddressop,
          out_IRmemop => out_IRmemop,
          out_RegDstop => out_RegDstop,
          out_Jumpop => out_Jumpop,
          out_Branchop => out_Branchop,
          out_MemReadop => out_MemReadop,
          out_MemToRegop => out_MemToRegop,
          out_AluopOP => out_AluopOP,
          out_MemWriteop => out_MemWriteop,
          out_Alurcop => out_Alurcop,
          out_RegWriteop => out_RegWriteop,
          out_Read_data_1op => out_Read_data_1op,
          out_Read_data_2op => out_Read_data_2op,
          out_AluResultop => out_AluResultop,
          out_zeroOp => out_zeroOp,
          out_Operationop => out_Operationop,
          out_ReadDataop => out_ReadDataop,
          out_AdderOutputop => out_AdderOutputop,
          out_PcAdderOutputop => out_PcAdderOutputop,
          out_shiftreg1op => out_shiftreg1op,
          out_shiftreg2op => out_shiftreg2op,
          out_DMMux_OutputOp => out_DMMux_OutputOp,
          out_D2Mux_OutputOp => out_D2Mux_OutputOp,
          out_D1Mux_OutputOp => out_D1Mux_OutputOp,
          out_intoregMux_OutputOp => out_intoregMux_OutputOp,
          out_intoAlugMux_OutputOp => out_intoAlugMux_OutputOp,
          out_SignExoutput => out_SignExoutput,
          out_andop => out_andop
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
