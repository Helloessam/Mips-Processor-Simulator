----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:04 02/06/2019 
-- Design Name: 
-- Module Name:    mux4to1 - Behavioral 
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

entity mux4to1 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : in  STD_LOGIC_VECTOR (31 downto 0);
           D : in  STD_LOGIC_VECTOR (31 downto 0);
           Z : out  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0));
end mux4to1;

architecture Behavioral of mux4to1 is
component mux2to1
 Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Z : out  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC);
	end component;
	signal s1,s2: STD_LOGIC_VECTOR (31 downto 0);
begin

m1: mux2to1 port map(A=>A,B=>B,Z=>s1,sel=>sel(0));

m2: mux2to1 port map(A=>C,B=>D,Z=>s2,sel=>sel(0));

m3: mux2to1 port map(A=>s1,B=>s2,Z=>Z,sel=>sel(1));

end Behavioral;

