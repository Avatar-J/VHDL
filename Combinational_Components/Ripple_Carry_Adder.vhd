----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:42 10/25/2022 
-- Design Name: 
-- Module Name:    Ripple_Carry_Adder - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Three_Bit_Ripple_Carry_Adder is

port(
	A, B :in std_logic_vector(2 downto 0);
	Cout :out std_logic;
	sum  :out std_logic_vector(2 downto 0) 
);
end Three_Bit_Ripple_Carry_Adder;

architecture Behavioral of Three_Bit_Ripple_Carry_Adder is

component Full_Adder
port(
	A, B, Cin :in std_logic;
	Cout, sum :out std_logic 
);
end component;

signal C : std_logic_vector(1 downto 0);

begin

Adder_one: Full_Adder port map(
	A    => A(0),
	B    => B(0),
	Cin  => '0',
	Cout => C(0),
	sum  => sum(0)
);

Adder_two: Full_Adder port map(
	A    => A(1),
	B    => B(1),
	Cin  => C(0),
	Cout => C(1),
	sum  => sum(1)
);

Adder_three: Full_Adder port map(
	A    => A(2),
	B    => B(2),
	Cin  => C(1),
	Cout => Cout,
	sum  => sum(2)
);

end Behavioral;

