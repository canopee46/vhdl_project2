----------------------------------------------------------------------
-- BCD to Seven Segments Display
----------------------------------------------------------------------
-- @michael - 2020/10
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
entity seven_seg is
--  generic (
--    g_CLKS_PER_BIT : integer := 48000000/9600     -- Needs to be set correctly
--    );

  port (
    i_bcd 		 : in  std_logic_vector(3 downto 0);
	 i_selector	 : in  std_logic_vector(1 downto 0);
    o_seven_seg : out std_logic_vector(6 downto 0);
	 o_sel_digit : out std_logic_vector(3 downto 0)
    );
end seven_seg;
 
 
architecture rtl of seven_seg is

begin

	with i_selector select
		o_sel_digit <= "1110" when "00",
							"1101" when "01",
							"1011" when "10",
							"0111" when others;

	with i_bcd select
		o_seven_seg <= "1111110" when "0000",	--0
							"0110000" when "0001",	--1
							"1101101" when "0010",	--2
							"1111001" when "0011",	--3
							"0110011" when "0100",	--4
							"1011011" when "0101",	--5
							"1011111" when "0110",	--6
							"1110000" when "0111",	--7
							"1111111" when "1000",	--8
							"1111011" when "1001",	--9
							"1110111" when "1010",  --A
							"0011111" when "1011",  --B
							"1001110" when "1100",  --C
							"0111101" when "1101",  --D
							"1001111" when "1110",  --E
							"1000111" when others;  --F
   
end rtl;
