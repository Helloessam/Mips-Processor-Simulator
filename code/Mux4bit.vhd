----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:31:22 04/06/2019 
-- Design Name: 
-- Module Name:    Mux4bit - Behavioral 
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

entity Mux4bit is
	port ( A : in STD_lOGIC_VECTOR (4 downto 0 );
			B : in STD_lOGIC_VECTOR (4 downto 0 );
			Sel : in STD_LOGIC;
			Mux_Output : out  STD_lOGIC_VECTOR (4 downto 0 )
			);
end Mux4bit;
		
architecture Behavioral of Mux4bit is

begin 

		Mux_Output <= A when Sel = '0' else B;

end Behavioral;