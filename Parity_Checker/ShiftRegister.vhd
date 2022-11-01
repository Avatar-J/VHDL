----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:48 10/28/2022 
-- Design Name: 
-- Module Name:    ShiftRegister - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShiftRightReg is
generic (n : integer := 8);
port(
	input   :in std_logic_vector(n-1 downto 0);
	clk, nload, Rshift_n  : in std_logic;
	output  : out std_logic_vector(n-1 downto 0)	
);
end ShiftRightReg;

architecture Behavioral of ShiftRightReg is

signal out_temp : std_logic_vector(n-1 downto 0);

begin

process (clk) 
	begin
		if (rising_edge(clk)) then 
			if (nload = '1') then 
				out_temp <= input;
			elsif(Rshift_n='1') then
				out_temp <= '0' & out_temp(n-1 downto 1);
			end if;
		end if;	
end process;		
					
output <= out_temp;

end Behavioral;

