----------------------------------------------------------------------
-- Utilisation de 3 entités: antirebond + compteur+ affichage 7 segments
-- 
----------------------------------------------------------------------
-- @michael - 2020/10
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
use ieee.numeric_std.all; 


entity top is
	port(   
		Clk: in std_logic;
		Reset: in std_logic;
		O_seven_seg : out std_logic_vector(6 downto 0);	-- pinout de l'afficheur 7 segments
		O_sel_digit : out std_logic_vector(3 downto 0)); -- selection de l'afficheur
end top;


---------------------------------------

architecture Structural of top is

-- Components Declaration 

component div_freq
	generic(
		clk_freq : integer := 48_000_000;
		period	: integer := 1000	);		 -- periode en ms
	port(
		clk    : in  std_logic;  			 -- input clock
		output : out std_logic);   -- counter value
end component;


component counter
	port(
		clk    : in  std_logic;  							 -- input clock
		reset  : in  std_logic;  							 -- asynchronous active low reset
		output : out std_logic_vector(3 downto 0));   -- counter value
end component;

component seven_seg
	port(   
		i_bcd 		: in  std_logic_vector(3 downto 0);
		i_selector	: in  std_logic_vector(1 downto 0);
		o_seven_seg : out std_logic_vector(6 downto 0);
		o_sel_digit : out std_logic_vector(3 downto 0));
end component;

-- Signals Declaration
signal s_button : std_logic;
signal s_counter : std_logic_vector(3 downto 0);
signal s_selector : std_logic_vector(1 downto 0) := "00";

begin 
    
-- Instanciation
	 
    Mydiv_freq: div_freq
    generic map(
		clk_freq => 48_000_000,
		period => 1000)
    port map(
		 clk => Clk,
		 output => s_button);
  
    Mycounter: counter
    port map(
		 clk => s_button,
		 reset => Reset,
		 output => s_counter);
 
    Myseven_seg: seven_seg
    port map(
		 i_bcd => s_counter,
		 i_selector => s_selector,
		 o_seven_seg => O_seven_seg,
		 o_sel_digit => O_sel_digit);
 
    
end Structural;