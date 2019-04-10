----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:37 04/04/2019 
-- Design Name: 
-- Module Name:    DataMemory - Behavioral 
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


entity DataMemory is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           MemoryRead : in  STD_LOGIC;
			  MemoryWrite : in  STD_LOGIC;
			  ReadData : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is
type DataMemorytype  is array (0 to 15)of STD_LOGIC_VECTOR (31 downto 0);
	--Starts from 0x100010000
	signal Data_Memory : DataMemorytype := 
				(x"00001010",x"00000010",x"00000011",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000");
	begin 
	process (MemoryWrite, MemoryRead)
	begin
	--i take the address from input and convert it to unsigned the to integer 
	-- 268500992 = 0x1001000 // div by 4 to get index 1,2,3,4
if ( MemoryWrite = '1' and MemoryRead = '0' ) then
	Data_Memory(to_integer(unsigned(Address)))<= WriteData (31 downto 24);
	Data_Memory(to_integer(unsigned(Address)+1))<= WriteData (23 downto 16);
	Data_Memory(to_integer(unsigned(Address)+2))<= WriteData (15 downto 8);
	Data_Memory(to_integer(unsigned(Address)+3))<= WriteData (7 downto 0);

elsif ( MemoryRead = '1' and  MemoryWrite = '0') then
	ReadData(31 downto 24)<= Data_Memory(to_integer(unsigned(Address)));
	ReadData(23 downto 16)<= Data_Memory(to_integer(unsigned(Address)+1));
   ReadData(15 downto 8)<= Data_Memory(to_integer(unsigned(Address)+2));
	ReadData(7 downto 0)<= Data_Memory(to_integer(unsigned(Address)+3));
	
	end if;
	end process;
end Behavioral;

