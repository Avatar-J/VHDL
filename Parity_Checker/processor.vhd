----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:55 11/01/2022 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
port(
		clk, reset, enter : in std_logic;
		input   : in std_logic_vector(7 downto 0 );
		output  : out std_logic
);
end processor;

architecture Behavioral of processor is

-- Datapath of parity checker
component Datapath is
port(
	clk, nload, shift_n, cnt, clear :in  std_logic;
									input   :in std_logic_vector(7 downto 0);     
	is_equal_four, LSB_is_one, is_not_zero :out std_logic
);
end component;

--cu of processor
component FSM is
	port(
		clk  : in std_logic;
		reset :in std_logic;
		enter :in std_logic;
		n_not_zero :in std_logic;
		LSB_is_one :in std_logic;
		nload, shift_n, cnt, clear :out std_logic
			
	);
end component;

signal nload, shift_n, cnt, clear, is_not_zero, LSB_is_one : std_logic;

begin

DP : Datapath port map(
		clk     => clk,
		nload   => nload,
		shift_n => shift_n, 
		cnt     => cnt, 
		clear   => clear,
		input   => input,     
	   is_equal_four  => output, 
		LSB_is_one     => LSB_is_one, 
		is_not_zero    => is_not_zero
);


cu : FSM port map(
	   clk    => clk,
		reset  => reset,
		enter  => enter,
		n_not_zero => is_not_zero,
		LSB_is_one => LSB_is_one,
		nload      => nload,
		shift_n    => shift_n,
		cnt        => cnt, 
		clear      => clear
);


end Behavioral;

