----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:06 10/28/2022 
-- Design Name: 
-- Module Name:    TFlipFlop - Behavioral 
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

entity TFlipFlop is
port(
	clk, T, set  :in std_logic;
	Q, notQ : out std_logic
);
end TFlipFlop;

architecture Behavioral of TFlipFlop is
signal T_temp : std_logic;
begin

process (clk, set) 
	begin 
	   if ( set = '1') then 
		  T_temp <= '1';
		elsif(rising_edge(clk)) then
			T_temp <= T xor T_temp;
		end if;
end process;		

Q <= T_temp;
notQ <= not T_temp;

end Behavioral;

