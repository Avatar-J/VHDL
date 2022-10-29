----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:31 10/28/2022 
-- Design Name: 
-- Module Name:    DFF_with_asynchronous_input - Behavioral 
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

entity DFF_with_asynchronous_input is
port(
   clk, D, reset, set : in std_logic;
   Q, notQ            : out std_logic	
); 
end DFF_with_asynchronous_input;

architecture Behavioral of DFF_with_asynchronous_input is
 signal Q_temp : std_logic;
begin

process (clk, reset, set) 
	begin
		if (reset = '1') then 
		  Q_temp  <= '0';
		elsif (set = '1') then 
			Q_temp <= '1';
		elsif(rising_edge(clk)) then 
			Q_temp <= D;
		end if;
end process;

notQ <= not Q_temp;
Q    <= Q_temp;		
			
end Behavioral;

