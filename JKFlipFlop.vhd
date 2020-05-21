library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity JKFlipFlop is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           En : in  STD_LOGIC;
           J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end JKFlipFlop;

architecture Behavioral of JKFlipFlop is

	signal r_reg : std_logic :='0';
	signal r_next: std_logic :='0';

begin

	-- JK Flip-Flop
	process(clk,reset)
		begin
			if(reset='1')then
				r_reg<='0';
			elsif(clk' event and clk='1')then
				r_reg<=r_next;
			end if;
	end process;
	
	-- Next State Logic - Characteristic Equation Q* = JQ' or K'Q
	r_next<= (J and not r_reg) or (not K and r_reg) when En = '1' else r_reg;
	
	--Output Logic
	Q<=r_reg;

end Behavioral;

