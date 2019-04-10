----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:53 04/06/2019 
-- Design Name: 
-- Module Name:    AluCtrl - Behavioral 
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

entity AluCtrl is
    Port ( Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end AluCtrl;

architecture Behavioral of AluCtrl is

begin
		
Operation <= "0010" when (Aluop = "00" or (Aluop = "10" and Funct = "100000" ))

else "0110" when (Aluop = "01" or ( Aluop = "10" and Funct = "100010"))

else "0000" when (Aluop = "10" and Funct = "100100")

else "0001" when (Aluop = "10" and Funct = "100101")

else "0111" when (Aluop= "10" and Funct = "101010");


end Behavioral;

