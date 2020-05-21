LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_DFlipFlop IS
END Tb_DFlipFlop;
 
ARCHITECTURE behavior OF Tb_DFlipFlop IS 
  
   --Inputs
   signal tb_clk : std_logic := '0';
   signal tb_reset : std_logic := '0';
   signal tb_En : std_logic := '0';
   signal tb_D : std_logic := '0';

 	--Outputs
   signal tb_Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.DFlipFlop(arch) PORT MAP (
          clk => tb_clk,
          reset => tb_reset,
          En => tb_En,
          D => tb_D,
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
   stim_proc: process
   begin		
   
		tb_reset <= '0';
		tb_En <= '0';
		wait for 20 ns;
		
		for I in 0 to 4 loop
			tb_D <= '1';
			wait for 100 ns;
			tb_D <= '0';
			wait for 100 ns;
			
			if (I = 1) then
				tb_En <= '1';
			end if;
			
			if (I = 3)then
				tb_Reset <= '1';
			end if;
		end loop;
		
		assert false
			report ""
			severity failure;
	
   end process;

END;
