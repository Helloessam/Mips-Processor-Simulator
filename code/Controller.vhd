----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:00 04/06/2019 
-- Design Name: 
-- Module Name:    Controller - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controller is Port ( 
				OpCode : in STD_LOGIC_VECTOR (5 downto 0 ); --instrcution 31-26
				RegDst : out STD_LOGIC;
				Jump : out STD_LOGIC;
				Branch : out STD_LOGIC;
				MemRead : out STD_LOGIC;
				MemToReg : out STD_LOGIC;
				Aluop : out STD_LOGIC_VECTOR (1 downto 0);
				MemWrite : out STD_LOGIC;
				Alurc : out STD_LOGIC;
				RegWrite : out STD_LOGIC 
		);
end Controller;

architecture Behavioral of Controller is

begin
		
		process(OpCode)
		begin
		
		RegWrite <= '0'; -- Nl3'i el assertion 3lshan el next command
		
		case OpCode is 
		
		when "000000" => -- R type commands Add, or , sub , slt  :0x00
		
				RegDst <= '1';
				Jump <= '0';
				Branch <= '0';
				MemRead <= '0';
				MemToReg <= '0';
				Aluop <= "10";
				MemWrite <= '0';
				Alurc <= '0';
				RegWrite <= '1' after 10 ns;
				
				
		when "100011" => -- I Lw 0x23
		
				RegDst <= '0';
				Jump <= '0';
				Branch <= '0';
				MemRead <= '1';
				MemToReg <= '1';
				Aluop <= "00";
				MemWrite <= '0';
				Alurc <= '1';
				RegWrite <= '1' after 10 ns;
				
				
		when "101011" => -- I Sw 0x28
		
				RegDst <= 'X';
				Jump <= '0';
				Branch <= '0';
				MemRead <= '0';
				MemToReg <= 'X';
				Aluop <= "00";
				MemWrite <= '1';
				Alurc <= '1';
				RegWrite <= '0' after 10 ns;

		when "000100" => -- I Beq 0x04
				RegDst <= 'X';
				Jump <= '0';
				Branch <= '1' after 2 ns;
				MemRead <= '0';
				MemToReg <= 'X';
				Aluop <= "01";
				MemWrite <= '0';
				Alurc <= '0';
				RegWrite <= '0';
				
		
		when "000010" => -- j jump 0x02
				RegDst <= 'X';
				Jump <= '1';
				Branch <= '0' ;
				MemRead <= '0';
				MemToReg <= 'X';
				Aluop <= "00";
				MemWrite <= '0';
				Alurc <= '0';
				RegWrite <= '0';
				
		when others => null; -- implement others
				RegDst <= '0';
				Jump <= '0';
				Branch <= '0' ;
				MemRead <= '0';
				MemToReg <= '0';
				Aluop <= "00";
				MemWrite <= '0';
				Alurc <= '0';
				RegWrite <= '0';		
				
	end case ;
	end process ;
end Behavioral;

