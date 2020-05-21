LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_JKFlipFlop IS
END Tb_JKFlipFlop;
 
ARCHITECTURE behavior OF Tb_JKFlipFlop IS 
 
   --Inputs
   signal tb_clk : std_logic := '0';
   signal tb_reset : std_logic := '0';
   signal tb_En : std_logic := '0';
   signal tb_J : std_logic := '0';
   signal tb_K : std_logic := '0';

 	--Outputs
   signal tb_Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.JKFlipFlop(Behavioral) PORT MAP (
          clk => tb_clk,
          reset => tb_reset,
          En => tb_En,
          J => tb_J,
          K => tb_K,
          Q => tb_Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		tb_clk <= '0';
		wait for clk_period/2;
		tb_clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   j_process: process
   begin		
		wait for 240 ns;
		tb_J <= '1';
		wait;
   end process;
	
	-- Stimulus process
   k_process: process
   begin		
		wait for 140 ns;
		tb_K <= '1';
		wait for 100 ns;
		tb_K <= '0';
		wait for 100 ns;
		tb_K <= '1';
		wait;
   end process;
	
	-- Stimulus process
   reset_process: process
   begin		
		wait for 740 ns;
		tb_reset <= '1';
		wait;
   end process;
	
	-- Stimulus process
   enable_process: process
   begin		
		wait for 20 ns;
		tb_En <= '1';
		wait;
   end process;
	
	-- Stimulus process
   stim_process: process
   begin		
		wait for 1000 ns;
		assert false
			report ""
			severity failure;
   end process;

END;
