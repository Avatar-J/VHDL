----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:07:11 10/19/2022 
-- Design Name: 
-- Module Name:    FourSegment - Behavioral 
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

entity FourSegment is
port (
	clk, reset :in  std_logic;
	inputs            :in  std_logic_vector(15 downto 0);
	AN                :out std_logic_vector(3 downto 0);
	segmentOutput     :out std_logic_vector(6 downto 0) 
	
);
end FourSegment;

architecture Behavioral of FourSegment is

--Anode Decorder
component AnodeDecoder is
   port (
   AN_in  : in  std_logic_vector(1 downto 0);
	AN_out : out std_logic_vector(3 downto 0)
);
end component;

-- Multiplexer
component Multiplexer is
   port(
	SEL     :in std_logic_vector(1 downto 0);
	D0, D1, D2, D3 :in std_logic_vector(3 downto 0);
	output  : out std_logic_vector( 3 downto 0)
);
end component;


--Seven Segment Decorder
component SevenSegmentDecoder is
port(
   input  :in std_logic_vector(3 downto 0);
	output :out std_logic_vector ( 6 downto 0)
);
 
end component;

-- Two bit decorder
component twoBitCounter is
port(
	clk, input, Reset :in std_logic;
	output     :out std_logic_vector(1 downto 0)   
);

end component;

--Nineteen bit counter
component NineteenBitCounter is
port(
   clk, input, Reset :in std_logic;
	output            :out std_logic_vector(18 downto 0)
	);
end component;

-- declaring my external signals
signal cnt_out : std_logic_vector (1 downto 0);
signal mult_out : std_logic_vector(3 downto 0);
signal new_clk  : std_logic_vector(18 downto 0); 
--signal inputs :  std_logic_vector(15 downto 0) := x"ABCD";  
begin

two_bit_counter: twoBitCounter port map(
			clk => new_clk(17),
			input => '1',
			Reset => reset,
			output => cnt_out
);

Four_To_One_Mux: Multiplexer port map(
			SEL    =>    cnt_out,
			D0     =>    inputs ( 15 downto 12),
			D1     =>    inputs ( 11 downto 8),
			D2     =>    inputs ( 7 downto 4),
			D3     =>    inputs ( 3 downto 0),
			output =>    mult_out	
);


anode_decoder: AnodeDecoder port map(
		AN_in       => cnt_out,
		AN_out      => AN
);

segmentDecoder: SevenSegmentDecoder port map(
		input     => mult_out,
		output  => segmentOutput
);

Nineteen_bit_counter: NineteenBitCounter port map(
		clk => clk,
		input => '1',
		Reset => reset,
		output => new_clk
);


end Behavioral;

