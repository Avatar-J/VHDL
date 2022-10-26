----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:57:09 10/25/2022 
-- Design Name: 
-- Module Name:    FSM_plus_n_factorial - Behavioral 
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

entity FSM_plus_n_factorial is
port(
	clk, enter, reset :in std_logic;
	n                 :in std_logic_vector(2 downto 0); 
	output            :out std_logic_vector(15 downto 0) 
);
end FSM_plus_n_factorial;


architecture Behavioral of FSM_plus_n_factorial is

signal is_greater : std_logic;
signal OE, SEL, pload, nload, downcnt : std_logic;



component n_factorial is
port(
	clk, pload, sel, output_enable, nload, downcnt :in std_logic;
	control_signal    :out std_logic;
	n                 :in std_logic_vector(2 downto 0);
	output            :out std_logic_vector(15 downto 0)
);
end component;


component State_cycles is
port(
	clk,enter, reset, is_greater : in std_logic;
	output_enable, sel, pload, nload, downcnt :out std_logic
);
end component;




begin

fsm: State_cycles port map(
	clk => clk,
	enter => enter,
	reset => reset,
	is_greater => is_greater,
	output_enable => OE,
	sel => sel,
	pload => pload,
	nload => nload,
	downcnt => downcnt
	
);

datapath: n_factorial port map(
	clk => clk,
	pload => pload,
	sel => sel,
	output_enable => OE, 
	nload => nload, 
	downcnt => downcnt, 
	control_signal  => is_greater ,  
	n       => n,
	output   => output

);


end Behavioral;

