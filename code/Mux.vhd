----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:27 04/05/2019 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

		
entity Mux is
	port ( A : in STD_lOGIC_VECTOR (31 downto 0 );
			B : in STD_lOGIC_VECTOR (31 downto 0 );
			Sel : in STD_LOGIC;
			Mux_Output : out  STD_lOGIC_VECTOR (31 downto 0 )
			);
end Mux;
		
architecture Behavioral of Mux is

begin 

		Mux_Output <= A when Sel = '0' else B;

end Behavioral;

