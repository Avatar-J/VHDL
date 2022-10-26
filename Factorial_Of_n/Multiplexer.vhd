----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:53:51 10/19/2022 
-- Design Name: 
-- Module Name:    Multiplexer - Behavioral 
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

entity Multiplexer is

port(
	SEL     :in std_logic_vector(1 downto 0);
	D0, D1, D2, D3 :in std_logic_vector(3 downto 0);
	output  : out std_logic_vector( 3 downto 0)
);

end Multiplexer;

architecture Behavioral of Multiplexer is
   
begin
	output <= D0 when (SEL = "00") else
				 D1 when (SEL = "01") else
				 D2 when (SEL = "10") else
				 D3 when (SEL = "11") else
				 D0;	

			  end Behavioral;

