----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:07 10/25/2022 
-- Design Name: 
-- Module Name:    Top_Module - Behavioral 
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

entity Top_Module is
port(
   clk     :in std_logic;
	input   :in std_logic_vector(2 downto 0);
	enter   :in std_logic;
	reset   :in std_logic;
	anode   :out std_logic_vector(3 downto 0);  
	segment :out std_logic_vector(6 downto 0)
	
);
end Top_Module;

architecture Behavioral of Top_Module is

component FSM_plus_n_factorial is
port(
	clk, enter, reset :in std_logic;
	n                 :in std_logic_vector(2 downto 0); 
	output            :out std_logic_vector(15 downto 0) 
);
end component;


component FourSegment is
port (
	clk, reset :in  std_logic;
	inputs            :in  std_logic_vector(15 downto 0);
	AN                :out std_logic_vector(3 downto 0);
	segmentOutput     :out std_logic_vector(6 downto 0) 
	
);
end component;


signal input_temp : std_logic_vector(15 downto 0);


begin

processor : FSM_plus_n_factorial port map(
	clk   => clk,
	enter =>  enter,
	reset =>  reset,
	n      =>   input,        
	output  =>   input_temp       
);
 
 

SS: FourSegment port map(
   clk  =>  clk,
	reset => reset,
	inputs  =>   input_temp,       
	AN      =>    anode ,
	segmentOutput =>   segment
);


end Behavioral;

