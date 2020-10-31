----------------------------------------------------------------------
-- Basic counter
----------------------------------------------------------------------
-- @michael - 2020/10
--

library ieee;
use ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

entity counter is
  port(
    clk    : in  std_logic;  							 -- input clock
    reset  : in  std_logic;  							 -- asynchronous active low reset
    output : out std_logic_vector(3 downto 0));   -- counter value
end counter;

architecture rtl of counter is
  signal count   : std_logic_vector(3 downto 0); --internal counter
  
begin

  output <= count;
  
  process(clk, reset)
  begin
    if(reset = '0') then                        --reset
      count <= "0000";                          --clear result register
    elsif(clk'event and clk = '1') then         --rising clock edge
      if(count = "1111") then
			count <= "0000";
		else
        count <= count + 1;                     --increment counter
      end if;    
    end if;
  end process;
  
end rtl;