----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:44:16 10/25/2022 
-- Design Name: 
-- Module Name:    anode_Decoder - Behavioral 
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

entity anode_Decoder is
port (
   AN_in  : in  std_logic_vector(1 downto 0);
	AN_out : out std_logic_vector(3 downto 0)
);
end anode_Decoder;

architecture Behavioral of anode_Decoder is

begin
  with AN_in select
		AN_out <= "0111" when "00",
					 "1011" when "01",
					 "1101" when "10",
					 "1110" when "11",
                "0111" when others;

end Behavioral;

