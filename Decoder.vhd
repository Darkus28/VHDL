library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
    Port ( en : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0));
end Decoder;

architecture Behavioral of Decoder is

	signal s : std_logic_vector(3 downto 0);

begin

	s <= en & a;
	
	with s select
		y <= "11111111" when "0000" | "0001" | "0010" | "0011" | "0100" | "0101" | "0110" | "0111",
			  "11111110" when "1000",
			  "11111101" when "1001",
			  "11111011" when "1010",
			  "11110111" when "1011",
			  "11101111" when "1100",
			  "11011111" when "1101",
			  "10111111" when "1110",
			  "01111111" when others;

end Behavioral;

