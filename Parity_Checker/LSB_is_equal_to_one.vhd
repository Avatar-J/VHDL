----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:56 11/01/2022 
-- Design Name: 
-- Module Name:    LSB_is_equal_to_one - Behavioral 
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

entity LSB_is_equal_to_one is
port(
	input  :in std_logic;
	LSB_is_one :out std_logic
);
end LSB_is_equal_to_one;

architecture Behavioral of LSB_is_equal_to_one is

begin
LSB_is_one <=  input;

end Behavioral;

