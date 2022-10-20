----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:26 10/19/2022 
-- Design Name: 
-- Module Name:    NineteenBitCounter - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NineteenBitCounter is
port(
   clk, input, Reset :in std_logic;
	output            :out std_logic_vector(18 downto 0)
	);
end NineteenBitCounter;

architecture Behavioral of NineteenBitCounter is

signal count : std_logic_vector (18 downto 0);

begin

TwoBitCounter: process (clk, Reset)
   begin
		 if ( Reset = '1') then 
				count <= b"000_000_000_000_000_0000";
		
		 elsif (rising_edge(clk)) then
		   if( input = '1') then 
			   count <= count + "01";		
			end if;	
		end if;
		
	end process;		

output <= count;

end Behavioral;

