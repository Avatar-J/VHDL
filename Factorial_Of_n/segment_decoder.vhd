----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:46:10 10/25/2022 
-- Design Name: 
-- Module Name:    segment_decoder - Behavioral 
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

entity segment_decoder is
port(
   input  :in std_logic_vector(3 downto 0);
	output :out std_logic_vector ( 6 downto 0)
);
end segment_decoder;

architecture Behavioral of segment_decoder is

begin
with input select
	output <= b"000_0001" when "0000",
	          b"100_1111" when "0001",
				 b"001_0010" when "0010",
				 b"000_0110" when "0011",
				 b"100_1100" when "0100",
				 b"010_0100" when "0101",
				 b"010_0000" when "0110",
				 b"000_1111" when "0111",
				 b"000_0000" when "1000",
				 b"000_0100" when "1001",
				 b"000_1000" when "1010",
				 b"110_0000" when "1011",
				 b"011_0001" when "1100",
				 b"100_0010" when "1101",
				 b"011_0000" when "1110",
				 b"011_1000" when "1111",
				 b"000_0000" when others;


end Behavioral;

