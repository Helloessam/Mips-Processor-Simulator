----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:42 02/13/2019 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.STD_Logic_arith.ALL;
use IEEE.STD_Logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           opcode : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

begin
process(a,b,opcode) is begin

if (opcode = "0000") 
then z <= a and b;
elsif (opcode = "0001") 
then z <= a or b;
elsif (opcode = "0010" )
then z <= a + b;
elsif (opcode = "0110") 
then z <= a - b;
elsif (opcode = "1100" )
then z <= a nor b;
elsif (opcode = "0111" )
then 
if(a < b) then z <= "00000000000000000000000000000001";
end if;
end if;

if (a = b) then zero <= '1';
else
zero <= '0';
end if;


end process;

end Behavioral;

