----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:45:33 10/24/2022 
-- Design Name: 
-- Module Name:    n_factorial - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity n_factorial is
port(
	clk, pload, sel, output_enable, nload, downcnt :in std_logic;
	control_signal    :out std_logic;
	n     :in std_logic_vector(2 downto 0);
	output            :out std_logic_vector(15 downto 0)
);
end n_factorial;



architecture Behavioral of n_factorial is

--Multiplexer
component mux2x1 
port(
	Sel     :in std_logic;
   D0, D1  :in std_logic_vector(15 downto 0);
   mux_out :out std_logic_vector(15 downto 0) 	
); 
end component;

--Product Register
component Product_Register 

generic (n: integer := 16);

port(
	clk, pload : in std_logic;
	D_in       : in std_logic_vector(n-1 downto 0);
	Q_out      : out std_logic_vector(n-1 downto 0) 
	

);
end component;

-- Tri state buffer
component Tri_state_buffer 
port(
	product :in std_logic_vector(15 downto 0);
	output_enable: in std_logic;
	product_out :out std_logic_vector(15 downto 0)
);
end component;

--comparator
component comparator 

port(
	n, const :in std_logic_vector(2 downto 0);
	output : out std_logic
);
end component;

--multiplier
component multiplier 
port(
	product :in std_logic_vector(15 downto 0);
	n       :in std_logic_vector(15 downto 0);
   mult_out :out std_logic_vector(15 downto 0) 	
);
end component;

--n counter
component n_counter 
port(
	clk, nload, downcnt: in std_logic;
	n_input              : in std_logic_vector(2 downto 0);
	n_output             : out std_logic_vector(2 downto 0)
);
end component;

signal multiplexer_out, multiplier_out, product_out : std_logic_vector(15 downto 0);
signal n_output    : std_logic_vector(2 downto 0); 
signal equation : std_logic_vector(15 downto 0);




begin

multiplexer1:mux2x1 port map (
	Sel     => sel,
	D0      => b"000_000_000_000_0001",
	D1      => multiplier_out,
   mux_out => multiplexer_out
	 
);

product_register1: product_register port map (

   clk    => clk,
   pload  => pload,
	D_in   => multiplexer_out,
	Q_out  => product_out
);

triStateBuffer: Tri_state_buffer port map (
   product       => product_out,
	output_enable => output_enable,
	product_out   => output
	);
	
counter: n_counter port map(
	clk      => clk,
	nload    => nload,
	downcnt  => downcnt,
	n_input  => n,
	n_output => n_output           
);	

comparator1: comparator port map(
   n     => n_output,
	const => "001",
	output => control_signal
);

equation <= "0000000000000" & n_output;

multiplier1: multiplier port map(
   product => product_out,
	n       => equation,
   mult_out => multiplier_out
	
);


end Behavioral;

