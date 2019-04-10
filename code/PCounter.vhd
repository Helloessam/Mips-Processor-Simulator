----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:55:53 04/06/2019 
-- Design Name: 
-- Module Name:    PCounter - Behavioral 
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

entity Pcounter is Port (  
				NextAddress : in  STD_LOGIC_VECTOR (31 downto 0) ;
            CurrentAddress : out  STD_LOGIC_VECTOR (31 downto 0) ; 
            Clk : in  STD_LOGIC);
end Pcounter;

architecture Behavioral of Pcounter is
		
begin
		process (Clk)
		begin
		if rising_edge(Clk) then
		Currentaddress <= NextAddress;
		end if;
		end process;
end Behavioral;

