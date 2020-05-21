library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PriorityEncoder is
    Port ( r : in  STD_LOGIC_VECTOR (4 downto 1);
           p : out  STD_LOGIC_VECTOR (2 downto 0));
end PriorityEncoder;

architecture Behavioral of PriorityEncoder is

begin

	process(r)
		begin
			if(r(4)='1')then
				p<="100";
			elsif(r(3)='1')then
				p<="011";
			elsif(r(2)='1')then
				p<="010";
			elsif(r(1)='1')then
				p<="001";
			else
				p<="000";
			end if;
		end process;

end Behavioral;

