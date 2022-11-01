----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:49:01 10/31/2022 
-- Design Name: 
-- Module Name:    is_equal_to_four - Behavioral 
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

entity is_equal_to_four is
port(
	input     :in std_logic_vector(7 downto 0);
	is_equal_four   :out std_logic 
);
end is_equal_to_four;

architecture Behavioral of is_equal_to_four is

begin
is_equal_four <= (not input(7)) and (not input(6))and (not input(5))and (not input(4))and (not input(3))and input(2)and (not input(1))and (not input(0));

end Behavioral;

