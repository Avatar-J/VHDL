----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:31:38 10/28/2022 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
generic (n: integer := 8);
port(
	clk, clear, cnt : in std_logic;
	cnt_out         : out std_logic_vector(n-1 downto 0) 
);
end counter;

architecture Behavioral of counter is

signal out_temp : std_logic_vector(n-1 downto 0);

begin

process (clk, clear) 
	begin 
		if (clear = '1') then 
			out_temp <= (others => '0');
		elsif (rising_edge(clk)) then
			if ( cnt = '1') then
				out_temp <= out_temp + 1;
			end if;	
		end if;
end process;
		
cnt_out <= out_temp;
		
end Behavioral;

