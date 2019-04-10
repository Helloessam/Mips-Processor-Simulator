----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:53 04/06/2019 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port ( IN0 : in  STD_LOGIC_VECTOR (31 downto 0);
           IN1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is
SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
begin
		Process(IN0,IN1)
		begin
		temp <= IN0 + IN1 ;
		end process;
		Output <= temp;
end Behavioral;

