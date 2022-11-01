----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:30:35 11/01/2022 
-- Design Name: 
-- Module Name:    Datapath - Behavioral 
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

entity Datapath is
port(
	clk, nload, shift_n, cnt, clear :in  std_logic;
									input   :in std_logic_vector(7 downto 0);     
	is_equal_four, LSB_is_one, is_not_zero :out std_logic
);
end Datapath;

architecture Behavioral of Datapath is

--Counter
component counter is
		generic (n: integer := 8);
		port(
			clk, clear, cnt : in std_logic;
			cnt_out         : out std_logic_vector(n-1 downto 0) 
		);
end component;

--Shift register 
component ShiftRightReg is
		generic (n : integer := 8);
		port(
			input   :in std_logic_vector(n-1 downto 0);
			clk, nload, Rshift_n  : in std_logic;
			output  : out std_logic_vector(n-1 downto 0)	
		);
end component;

--counter is equal to four
component is_equal_to_four is
		port(
			input     :in std_logic_vector(7 downto 0);
			is_equal_four   :out std_logic 
		);
end component;

--value of the input register is not equal to zero
component is_not_equal_to_zero is
	port(
	    input       : in std_logic_vector(7 downto 0);
		 is_not_zero : out std_logic                                                                                                                                                                                            
	);
end component;

--LSB of n is equal to one
component LSB_is_equal_to_one is
		port(
			input  :in std_logic;
			LSB_is_one :out std_logic
		);
end component;

signal cnt_out, n_out  : std_logic_vector(7 downto 0);


begin
 countReg: counter port map(
	      clk      => clk,
			clear    => clear,
			cnt      => cnt,
			cnt_out  => cnt_out       
 ); 
 
 N_reg: ShiftRightReg port map(
			input    => input,
			clk      => clk,
			nload    => nload,
			Rshift_n => shift_n,
			output   => n_out
 );

equal_four: is_equal_to_four port map(
			input          =>  cnt_out,
			is_equal_four  =>  is_equal_four 
);

not_zero : is_not_equal_to_zero port map(
			input       => n_out,
		   is_not_zero => is_not_zero  
);

LSB_one : LSB_is_equal_to_one port map(
			input       => n_out(0),
			LSB_is_one  => LSB_is_one
);

end Behavioral;

