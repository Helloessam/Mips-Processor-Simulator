----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:00 04/06/2019 
-- Design Name: 
-- Module Name:    Concat - Behavioral 
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

entity Concat is
PORT(
		inM : IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		inC : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Catop   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end Concat;

architecture Behavioral of Concat is
		SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0);
begin
		PROCESS(inM,inC) BEGIN
		temp <=  inC & inM & "00";
	END PROCESS;
		Catop <= temp ;

end Behavioral;

