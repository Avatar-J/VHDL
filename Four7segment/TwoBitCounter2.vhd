----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:55:35 10/19/2022 
-- Design Name: 
-- Module Name:    TwoBitCounter2 - Behavioral 
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

entity TwoBitCounter2 is
port(
	clk, input, Reset :in std_logic;
	output     :out std_logic_vector(1 downto 0)   
);
end TwoBitCounter2;

architecture Behavioral of TwoBitCounter2 is

 type state_type is ( c0, c1, c2, c3);
 signal ps1, ns1 : state_type;
 
begin

sync_proc: process ( clk, ns1, reset)
     begin 
			if (reset = '1') then 
				ps1 <= c0;
			elsif (rising_edge(clk)) then 
				ps1 <= ns1;
			end if;
end process;   			

comb_proc: process ( ps1, input)
  begin 
		output <= "00";
		
		case ps1 is 
		  when c0 => output <= "00";
				if ( input <= '1') then 
				  ns1 <= c1;
				 else
					ns1 <= c0;
				end if;	
					
		 when c1 => output <= "01";
				if ( input <= '1') then 
				  ns1 <= c2;
				 else
					ns1 <= c1;
				 end if;		
					
		 when c2 => output <= "10";
				if ( input <= '1') then 
				  ns1 <= c3;
				 else
					ns1 <= c2;
				end if;		
					
		 when c3 => output <= "11";
				if ( input <= '1') then 
				  ns1 <= c0;
				 else
					ns1 <= c3;
				end if;	
    end case;

end process;	 
		   


end Behavioral;

