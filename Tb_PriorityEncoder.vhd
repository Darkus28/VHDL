LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Tb_PriorityEncoder IS
END Tb_PriorityEncoder;
 
ARCHITECTURE behavior OF Tb_PriorityEncoder IS 
 
   --Inputs
   signal tb_r : std_logic_vector(4 downto 1) := (others => '0');

 	--Outputs
   signal tb_p : std_logic_vector(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.PriorityEncoder(Behavioral) PORT MAP (
          r => tb_r,
          p => tb_p
        );

   -- Stimulus process
   stim_proc: process
   begin		
   
--	tb_r <= "0000";
--	wait for 20 ns;
--	
--	tb_r <= "0001";
--	wait for 20 ns;
--	
--	tb_r <= "0010";
--	wait for 20 ns;
--	
--	tb_r <= "0011";
--	wait for 20 ns;
--	
--	tb_r <= "0100";
--	wait for 20 ns;
--	
--	tb_r <= "0101";
--	wait for 20 ns;
--	
--	tb_r <= "0110";
--	wait for 20 ns;
--	
--	tb_r <= "0111";
--	wait for 20 ns;
--	
--	tb_r <= "1000";
--	wait for 20 ns;
--	
--	tb_r <= "1001";
--	wait for 20 ns;
--	
--	tb_r <= "1010";
--	wait for 20 ns;
--	
--	tb_r <= "1011";
--	wait for 20 ns;
--	
--	tb_r <= "1111";
--	wait for 20 ns;
	
	for I in 0 to 15 loop --I defaults to type integer
		tb_r <= std_logic_vector(to_unsigned(I,4));
		wait for 20 ns;
	end loop;
	
	--terminate simulation
	assert false
	report "Simulation Completed"
	Severity failure;
	
   end process;

END;
