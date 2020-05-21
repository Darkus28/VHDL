LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Tb_Decoder IS
END Tb_Decoder;
 
ARCHITECTURE behavior OF Tb_Decoder IS 
 
   --Inputs
   signal tb_en : std_logic := '0';
   signal tb_a : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal tb_y : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.Decoder(Behavioral) PORT MAP (
          en => tb_en,
          a => tb_a,
          y => tb_y
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
   
--	tb_en <= '0';
--	tb_a <= "000";
--	wait for 50 ns;
--	
--	tb_en <= '0';
--	tb_a <= "001";
--	wait for 50 ns;
--	
--	tb_en <= '0';
--	tb_a <= "010";
--	wait for 50 ns;
--	
--	tb_en <= '0';
--	tb_a <= "011";
--	wait for 50 ns;
--	
--	tb_en <= '0';
--	tb_a <= "100";
--	wait for 50 ns;
--	
--	tb_en <= '0';
--	tb_a <= "101";
--	wait for 50 ns;
--	
--	tb_en <= '0';
--	tb_a <= "110";
--	wait for 50 ns;
--	
--	tb_en <= '0';
--	tb_a <= "111";
--	wait for 50 ns;
--	
--	--enable chip
--	tb_en <= '1';
--	tb_a <= "000";
--	wait for 50 ns;
--	
--	tb_en <= '1';
--	tb_a <= "001";
--	wait for 50 ns;
--	
--	tb_en <= '1';
--	tb_a <= "010";
--	wait for 50 ns;
--	
--	tb_en <= '1';
--	tb_a <= "011";
--	wait for 50 ns;
--	
--	tb_en <= '1';
--	tb_a <= "100";
--	wait for 50 ns;
--	
--	tb_en <= '1';
--	tb_a <= "101";
--	wait for 50 ns;
--	
--	tb_en <= '1';
--	tb_a <= "110";
--	wait for 50 ns;
--	
--	tb_en <= '1';
--	tb_a <= "111";
--	wait for 50 ns;

	tb_en <= '0';
	for I in 0 to 7 loop --I defaults to type integer
		tb_a <= std_logic_vector(to_unsigned(I,3));
		wait for 50 ns;
	end loop;
	
	tb_en <= '1';
	for I in 0 to 7 loop
		tb_a <= std_logic_vector(to_signed(I,3));
		wait for 50 ns;
	end loop;
	
	assert false
	report "Simulation Completed"
	severity failure;
	
   end process;

END;
