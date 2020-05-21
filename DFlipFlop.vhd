library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFlipFlop is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           En : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC
			  );
end DFlipFlop;

architecture arch of DFlipFlop is

	signal r_reg : std_logic :='0';
	signal r_next: std_logic :='0';

begin

	-- D Flip-Flop
	process(clk,reset)
		begin
			if(reset='1')then
				r_reg<='0';
			elsif(clk' event and clk='1')then
				r_reg<=r_next;
			end if;
	end process;
	
	-- Next State Logic
	r_next<= D when En='1' else
				r_reg;
				
	--Output Logic
	Q<=r_reg;


end arch;

