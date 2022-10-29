----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:53 10/28/2022 
-- Design Name: 
-- Module Name:    Four_bit_DFF_register - Behavioral 
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

entity Four_bit_DFF_register is
generic  (n : integer := 4);
port(
   clk, clear, load : in std_logic;
	D_in             :in std_logic_vector( n-1 downto 0);
	Q_out  :out std_logic_vector(n-1 downto 0) 
);
end Four_bit_DFF_register;

architecture Behavioral of Four_bit_DFF_register is

signal Q_temp : std_logic_vector(n-1 downto 0);

begin

process (clk, clear) 
	begin
		if (clear = '1') then 
			Q_temp <= (others => '0');
		elsif (rising_edge(clk)) then 
			if (load = '1') then
				Q_temp <= D_in;
			end if;
      end if;
end process;		

Q_out <= Q_temp;

	
		
end Behavioral;

