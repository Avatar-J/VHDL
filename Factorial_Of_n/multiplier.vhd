----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:22 10/24/2022 
-- Design Name: 
-- Module Name:    multiplier - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
port(
	product :in std_logic_vector(15 downto 0);
	n       :in std_logic_vector(15 downto 0);
   mult_out :out std_logic_vector(15 downto 0) 	
);
end multiplier;

architecture Behavioral of multiplier is
signal mult_temp : std_logic_vector(31 downto 0);

begin

mult_temp <= product * n;

mult_out <= mult_temp(15 downto 0);

end Behavioral;

