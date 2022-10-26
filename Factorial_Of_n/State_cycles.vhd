----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:04:59 10/25/2022 
-- Design Name: 
-- Module Name:    State_cycles - Behavioral 
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

entity State_cycles is
port(
	clk,enter, reset, is_greater : in std_logic;
	output_enable, sel, pload, nload, downcnt :out std_logic
	
);
end State_cycles;


architecture Behavioral of State_cycles is

type state_type is ( S0, S1, S2, S3, S4, S5);
signal ps1, ns1 : state_type;
signal control_signal : std_logic_vector(4 downto 0);

begin


sel <= control_signal(4);
pload <= control_signal(3);
nload <= control_signal(2);
downcnt <= control_signal(1);
output_enable <= control_signal(0);

syn_proc: process(clk, reset)
begin
	if(reset='1') then
		ps1 <= S0;
	elsif(rising_edge(clk)) then
			ps1 <= ns1;
	end if;
end process;


comb_proc: process (	is_greater, ps1, enter)
begin
	
	
	case ps1 is
		when S0 => control_signal <= "01000";
		ns1 <= S1;
		
		when S1 => control_signal <= "-0100";
		if ( enter = '1') then 
			ns1 <= S2;
		else 
			ns1 <= S1;
		end if;
			
		when S2 => control_signal <= "-----";
		if (is_greater ='1') then 
			ns1 <= S3;
		else 
			ns1 <= S5;
		end if;	
			
		when S3 => control_signal <= "11000";
			ns1 <= S4;
			
		when S4 => control_signal <= "-0010";
			if (is_greater = '1') then
			   ns1 <= S2;
			else
				ns1 <= S5;
			end if;	
				
		when S5 => control_signal <= "-0001";
			ns1 <= S5;
			
		end case;	
			
			
end process;

end Behavioral;

