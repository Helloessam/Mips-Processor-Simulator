----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:44 04/05/2019 
-- Design Name: 
-- Module Name:    MIPS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MIPS is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC
			  );
end MIPS;

architecture Behavioral of MIPS is
		-- Pc o/p
		signal CurrentAddressop : STD_LOGIC_VECTOR (31 downto 0) ; 
		--Instruction Memory o/p
		signal IRmemop :  std_logic_vector(31 downto 0); --o/p InstructionMem
		-- controller o/p
		signal RegDstop : std_logic;
      signal  Jumpop : std_logic;
      signal   Branchop : std_logic;
      signal   MemReadop : std_logic;
      signal   MemToRegop : std_logic;
      signal   AluopOP : std_logic_vector(1 downto 0);
      signal   MemWriteop : std_logic;
      signal  Alurcop : std_logic;
      signal   RegWriteop :  std_logic;
		--Registerfile o/p
		signal Read_data_1op : std_logic_vector(31 downto 0);
      signal Read_data_2op : std_logic_vector(31 downto 0);
		
		--ALu O/P
		signal AluResultop : std_logic_vector(31 downto 0);
      signal zeroOp : std_logic;
		
		--ALu Ctrl o/p
		signal Operationop :  std_logic_vector(3 downto 0);
		
		--DataMemory o/p
      signal ReadDataop :   std_logic_vector(31 downto 0);
		
		--Adder o/p
		signal AdderOutputop :  std_logic_vector(31 downto 0);
      -- pc adder 
		signal PcAdderOutputop :  std_logic_vector(31 downto 0);
		-- concat o/p
		signal concatenateOp:  STD_LOGIC_VECTOR(31 DOWNTO 0);
		--shiftreg1
		signal shiftreg1op : std_logic_vector(31 downto 0);
		--shiftreg2 from signextender
		signal shiftreg2op : std_logic_vector(31 downto 0);
    --DM_Mux o/p
		signal DMMux_OutputOp :  std_logic_vector(31 downto 0);
	 --Upper2d mux
		signal D2Mux_OutputOp :  std_logic_vector(31 downto 0);
	--Upperfristmux
		signal D1Mux_OutputOp :  std_logic_vector(31 downto 0);
	--intoregMux
		signal intoregMux_OutputOp :  std_logic_vector(4 downto 0);
	--AluMux
		signal intoAlugMux_OutputOp :  std_logic_vector(31 downto 0);
		
	 --SignExtend o/p
        signal SignExoutput :  std_logic_vector(31 downto 0);
		  
	-- And2to1 o/p
        signal   andop :  std_logic;
	-----------------------Components-------------------------
		 
	-- Pc Component
	 COMPONENT Pcounter is Port (  
				NextAddress : in  STD_LOGIC_VECTOR (31 downto 0) ;
            CurrentAddress : out  STD_LOGIC_VECTOR (31 downto 0) ; 
            Clk : in  STD_LOGIC);
	END COMPONENT;
	
	-- PC ADDER Component
	COMPONENT PCADDER
    PORT(
         IN0 : IN  std_logic_vector(31 downto 0);
         Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 -- concat unit 
	 COMPONENT Concat is
		PORT(
		inM : IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		inC : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Catop   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
	End COMPONENT;
	
	--Instruction Memory Component
	COMPONENT InstructionMemory IS 
  port (   
 		Address  : in  std_logic_vector(31 downto 0); 
 		Instruction : out std_logic_vector(31 downto 0)); 
	END COMPONENT; 
 
	--Shift logic unit 
    COMPONENT Shifter
    PORT(
         Input : IN  std_logic_vector(31 downto 0);
         Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 
	 -- Controller
	 COMPONENT Controller
    PORT(
         OpCode : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         Jump : OUT  std_logic;
         Branch : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemToReg : OUT  std_logic;
         Aluop : OUT  std_logic_vector(1 downto 0);
         MemWrite : OUT  std_logic;
         Alurc : OUT  std_logic;
         RegWrite : OUT  std_logic
        );
    END COMPONENT;
    
	 --Registerfile
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
	 
	  --ALU
	 COMPONENT IAlu
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         AluCtrl : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
	 
	--AluControl unit 
	 COMPONENT AluCtrl
    PORT(
         Funct : IN  std_logic_vector(5 downto 0);
         Aluop : IN  std_logic_vector(1 downto 0);
         Operation : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	
	--DataMemory 
	  COMPONENT DataMemory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         MemoryRead : IN  std_logic;
         MemoryWrite : IN  std_logic;
         ReadData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 
	 --Adder
	 COMPONENT Adder
    PORT(
         IN0 : IN  std_logic_vector(31 downto 0);
         IN1 : IN  std_logic_vector(31 downto 0);
         Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 
	 --Mux4bit 
	  COMPONENT Mux4bit
    PORT(
         A : IN  std_logic_vector(4 downto 0);
         B : IN  std_logic_vector(4 downto 0);
         Sel : IN  std_logic;
         Mux_Output : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
	 
    --Mux
	  COMPONENT Mux
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Sel : IN  std_logic;
         Mux_Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 
	 --SignExtend
	  COMPONENT SignExtend
    PORT(
         input : IN  std_logic_vector(15 downto 0);
         output : OUT  std_logic_vector(31 downto 0));
    END COMPONENT;
    --And2to1
	 COMPONENT And2to1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         OP : OUT  std_logic
        );
    END COMPONENT;

begin
PcMain :  entity work.Pcounter(Behavioral) 
	port map (
			Clk => Clk,
			NextAddress => D2Mux_OutputOp,
         CurrentAddress => CurrentAddressop
	); 
	
	-- Pc adder 
	Pcadd :  entity work.PCADDER(Behavioral) 
	port map (
			IN0 => CurrentAddressop,
         Output  => PcAdderOutputop
	);
	
	-- concat
	IConcat: entity work.Concat(Behavioral)
	PORT MAP(
		inM => IRmemop(25 DOWNTO 0),
		inC => PcAdderOutputop(31 DOWNTO 28),
		Catop  => concatenateOp
	);
	-- instruction Memory 
	IRmemory : entity work.InstructionMemory(Behavioral)
	port map (
		Address  => CurrentAddressop,
 		Instruction =>	IRmemop
	);
	--shiftleft2 upper left 
	shiftl2 : entity  work.Shifter(Behavioral)
	port map (
	Input => IRmemop,
  Output => shiftreg1op
);


	--controller 
	Cntr : entity  work.Controller(Behavioral)
	port map (
			OpCode => IRmemop(31 DOWNTO 26),
         RegDst => RegDstop,
         Jump => Jumpop,
         Branch => Branchop,
         MemRead => MemReadop,
         MemToReg => MemToRegop,
         Aluop => AluopOP,
         MemWrite => MemWriteop,
         Alurc => Alurcop,
         RegWrite => RegWriteop
	);
	
	--INTOREG MUX
	IntoRegMux : entity  work.Mux4bit(Behavioral)
	port map (
			A => IRmemop(20 DOWNTO 16),
         B =>  IRmemop(15 DOWNTO 11),
         Sel => RegDstop,
         Mux_Output => intoregMux_OutputOp
        );
	-- Register File 
	RegFile : entity  work.Registerfile(Behavioral)
	port map (
			Read_reg_1 =>IRmemop(25 DOWNTO 21),
         Read_reg_2 =>IRmemop(20 DOWNTO 16),
         Write_reg => intoregMux_OutputOp,
         Write_data => DMMux_OutputOp,
         WriteEnable =>RegWriteop,
         Read_data_1 =>Read_data_1op,
         Read_data_2 =>Read_data_2op
	 );
	 
	 
	 -- Signextender
		signEX  : entity work.SignExtend(Behavioral)
	port map (
         input => IRmemop(15 DOWNTO 0),
         output => SignExoutput
        );
		 
		 
	--shifsignex 
	shifsignex : entity  work.Shifter(Behavioral)
	port map (
	Input => SignExoutput,
   Output => shiftreg2op
	);	  
	--  adder 
	iadderr :  entity work.Adder(Behavioral) 
	port map (
			IN0 => PcAdderOutputop,
			IN1 => shiftreg2op,
         Output  => AdderOutputop
	);
	--Upperfristmux
	Upperfristmux : entity work.Mux(Behavioral)
	port map (
         A => PcAdderOutputop,
         B => AdderOutputop,
         Sel => andop,
         Mux_Output => D1Mux_OutputOp
        );
	--Upper2ndmux 
	Mux2D : entity work.Mux(Behavioral)
	port map (
         A =>  D1Mux_OutputOp,
         B => concatenateOp, 
         Sel => Jumpop,
         Mux_Output => D2Mux_OutputOp
        );
	 -- out of reg --intoAlu mux
	 intoAluMux : entity work.Mux(Behavioral)
	port map (
         A => Read_data_2op,
         B => SignExoutput,
         Sel => Alurcop,
         Mux_Output => intoAlugMux_OutputOp
        );
	-- Alu 	  
	MipsAlu : entity work.IAlu(Behavioral)
	port map (
         A => Read_data_1op,
         B => intoAlugMux_OutputOp,
         AluCtrl => Operationop,
         Output => AluResultop,
         zero => zeroOp
        );
	--branch and 
	Band : entity work.And2to1(Behavioral) 
	port map (
			A => Branchop,
         B => zeroOp,
			OP =>andop
	);
	-- Alu contorler 
	AluCNT : entity work.AluCtrl(Behavioral)
	port map (
			Funct => IRmemop(5 DOWNTO 0),
         Aluop => AluopOP,
         Operation => Operationop
        );
		  
		
	-- DM Data memory 
	DM : entity work.DataMemory(Behavioral) 
	port map (
			Address => AluResultop,
         WriteData => Read_data_2op,
         MemoryRead => MemReadop,
         MemoryWrite => MemWriteop,
         ReadData => ReadDataop 
	);
	
	-- Mux After data memory 
	MuxDM : entity work.Mux(Behavioral)
	port map (
         A => ReadDataop,
         B =>  AluResultop,
         Sel => MemToRegop,
         Mux_Output => DMMux_OutputOp
        );
end Behavioral;

