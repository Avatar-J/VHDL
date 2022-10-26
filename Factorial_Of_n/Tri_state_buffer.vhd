----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:59:21 10/24/2022 
-- Design Name: 
-- Module Name:    Tri_state_buffer - Behavioral 
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

entity Tri_state_buffer is
port(
	product :in std_logic_vector(15 downto 0);
	output_enable: in std_logic;
	product_out :out std_logic_vector(15 downto 0)
);
end Tri_state_buffer;

architecture Behavioral of Tri_state_buffer is

begin
product_out <= product when output_enable = '1' else
					(others => '0');	

end Behavioral;

