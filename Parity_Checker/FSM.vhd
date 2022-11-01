----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:05:21 11/01/2022 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is
	port(
		clk  : in std_logic;
		reset :in std_logic;
		enter :in std_logic;
		n_not_zero :in std_logic;
		LSB_is_one :in std_logic;
		nload, shift_n, cnt, clear :out std_logic
			
	);
end FSM;

architecture Behavioral of FSM is

type state_type is (st0, st1, st2, st3, st4, st5);
signal ps1, ns1 : state_type;
signal control_word : std_logic_vector(3 downto 0);


begin

clear <= control_word(3);
cnt   <= control_word(2);
nload <= control_word(1);
shift_n <= control_word(0);

syn_proc: process (clk, reset, ns1) 
	begin
		if (reset = '1') then 
			ps1 <= st0;
		elsif(rising_edge(clk)) then 
		   ps1 <= ns1;
	   end if;
end process;


comb_proc: process ( ps1, enter, n_not_zero, LSB_is_one )
 begin 
		case ps1 is
				when st0 => control_word <= "1000";
				ns1  <= st1;
            
				when st1 => control_word <= "0010";
					if (enter = '1') then 
						ns1 <= st2;
					else
						ns1 <= st1;
					end if;
					
				when st2 => control_word <= "0000";
					if(n_not_zero ='1') then 
						if(LSB_is_one = '1') then 
							ns1 <= st3;
						else 
							ns1 <= st4;
						end if;
					else 
					  ns1 <= st5;
					end if;
						
				when st3 => control_word <= "0100";
					ns1 <= st4;
					
				when st4 => control_word <= "0001";
				   if ( n_not_zero = '1') then 
						ns1 <= st2;
					else
						ns1 <= st5;
					end if;

				when st5 => control_word <= "0000";
					 ns1 <= st5;
					 
			end case;
end process;

end Behavioral;

