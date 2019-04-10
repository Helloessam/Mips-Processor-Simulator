----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:53:55 03/07/2019 
-- Design Name: 
-- Module Name:    Registerfile - Behavioral 
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

entity Registerfile is
    Port ( Read_reg_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_reg_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_reg : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteEnable : in  STD_LOGIC;
           Read_data_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Read_data_2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Registerfile;

architecture Behavioral of Registerfile is
type reg_file_type is array (0 to 31 ) of 
std_logic_vector(31 downto 0);
signal reg_array : reg_file_type :=(x"00000000",x"11111111",x"22222222",x"33333333",x"44444444",x"55555555",x"66666666",x"77777777",x"88888888",x"99999999",x"AAAAAAAA",x"BBBBBBBB",x"CCCCCCCC",x"DDDDDDDD",x"EEEEEEEE",x"FFFFFFFF",x"00000000",x"11111111",x"22222222",x"33333333",x"44444444",x"55555555",x"66666666",x"77777777",x"88888888",x"99999999",x"AAAAAAAA",x"BBBBBBBB",x"CCCCCCCC",x"DDDDDDDD",x"EEEEEEEE",x"FFFFFFFF");
begin

Read_data_1<=reg_array(to_integer(unsigned(Read_reg_1)));
Read_data_2<=reg_array(to_integer(unsigned(Read_reg_2)));
process (WriteEnable)
begin
if (WriteEnable='1') then
reg_array(to_integer(unsigned(Write_reg))) <= Write_data;
end if ;
end process;
end Behavioral;