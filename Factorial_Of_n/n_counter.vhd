----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:32 10/24/2022 
-- Design Name: 
-- Module Name:    n_counter - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity n_counter is
port(
	clk, nload, downcnt: in std_logic;
	n_input              : in std_logic_vector(2 downto 0);
	n_output             : out std_logic_vector(2 downto 0)
);
end n_counter;

architecture Behavioral of n_counter is
 
 signal n : std_logic_vector(2 downto 0);
 
begin
process (clk) 
	begin
		if (rising_edge(clk)) then 
			if (nload = '1') then
				n <= n_input;
			elsif (downcnt = '1') then 
				n <= n - 1;
			end if;
		end if;
end process;

n_output <= n;		
				  

end Behavioral;

