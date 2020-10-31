----------------------------------------------------------------------
-- Diviseur de frequence
----------------------------------------------------------------------
-- @michael - 2020/10
--

library ieee;
use ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

entity div_freq is
	generic(
		clk_freq : integer := 48_000_000;
		period	: integer := 1000	);		 -- periode en ms
	port(
		clk    : in  std_logic;  			 -- input clock
		output : out std_logic);   -- counter value
end div_freq;


architecture rtl of div_freq is
  signal flag   : std_logic; 				 --counter overflow
  
begin

	output <= flag;
  
	process(clk)
	variable count: integer range 0 to (clk_freq/1000/2)*period := 0;
	begin
	if(clk'event and clk = '1') then         --rising clock edge
      if(count < (clk_freq/1000/2)*period) then
			count := count + 1;					  --increment counter
		else
        flag <= not flag;
		  count := 0;
      end if;    
    end if;
  end process;
  
end rtl;
