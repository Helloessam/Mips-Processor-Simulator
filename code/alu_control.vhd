----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:43 02/20/2019 
-- Design Name: 
-- Module Name:    alu_control - Behavioral 
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

entity alu_control is
    Port ( instruction : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           operation : out  STD_LOGIC_VECTOR (3 downto 0));
end alu_control;

architecture Behavioral of alu_control is

begin

operation <= "0010" when (op = "00" or (op = "10" and instruction = "100000" ))

else "0110" when (op = "01" or ( op = "10" and instruction = "100010"))

else "0000" when (op = "10" and instruction = "100100")

else "0001" when (op = "10" and instruction = "100101")

else "0111" when (op = "10" and instruction = "101010");




end Behavioral;

