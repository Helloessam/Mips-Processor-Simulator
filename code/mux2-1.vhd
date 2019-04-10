----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:02:41 02/06/2019 
-- Design Name: 
-- Module Name:    mux2-1 - Behavioral 
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

entity mux2-1 is
    Port ( A : in  STD_LOGIC_VECTOR (0 downto 32);
           B : in  STD_LOGIC_VECTOR (0 downto 32);
           Z : out  STD_LOGIC_VECTOR (0 downto 32);
           sel : in  STD_LOGIC);
end mux2-1;

architecture Behavioral of mux2-1 is

begin

Z <= A when (sel = '0') else B;

end Behavioral;



