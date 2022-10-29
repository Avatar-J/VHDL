----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:38 10/28/2022 
-- Design Name: 
-- Module Name:    D_FlipFlop - Behavioral 
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

entity D_FlipFlop is
port(
	clk,D    :in std_logic;
	Q, notQ  : out std_logic
); 
end D_FlipFlop;

architecture Behavioral of D_FlipFlop is
 signal Q_temp : std_logic;
begin

process (clk)
  begin 
		if (rising_edge(clk)) then 
			Q_temp <= D;
		end if;
  end process;

notQ <= not Q_temp;
Q    <= Q_temp;  

end Behavioral;

