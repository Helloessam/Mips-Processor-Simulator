----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:58:54 04/05/2019 
-- Design Name: 
-- Module Name:    IAlu - Behavioral 
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

entity IAlu is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           AluCtrl : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC);
end IAlu;

architecture Behavioral of IAlu is

begin
	process(A,B,AluCtrl) is 
	begin

if (AluCtrl = "0000") 
then Output <= A and B;
elsif (AluCtrl = "0001") 
then Output <= A or B;
elsif (AluCtrl = "0010" )
then Output <= std_logic_vector(unsigned(A) + unsigned(B));
elsif (AluCtrl = "0110") 
then Output <= std_logic_vector(unsigned(A) - unsigned(B));
elsif (AluCtrl = "1100" )
then Output <= A nor B;
elsif (AluCtrl = "0111" )
then 
if(signed(A) < signed(B)) then Output <= x"00000001";
else Output <= x"00000000";
end if;
end if;

if (A = B) then zero <= '1';
else
zero <= '0';
end if;


end process;

end Behavioral;

