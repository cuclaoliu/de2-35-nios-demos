 library ieee;
use ieee.std_logic_1164.all;
entity myfirstnios is port(
	------------ CLOCK ----------
	CLOCK_50		: in	std_logic;
	------------ LED ----------
	LEDG			: out	std_logic_vector(8 downto 0);
	LEDR			: out	std_logic_vector(17 downto 0);
	------------ KEY ----------
	KEY			: in	std_logic_vector(3 downto 0);
	------------ SW ----------
	SW				: in	std_logic_vector(17 downto 0)
);
end;
architecture arc of myfirstnios is
--  REG/WIRE declarations
    component nios_core is
        port (
            clk_clk       : in  std_logic    := 'X';             -- clk
            reset_reset_n : in  std_logic    := 'X';             -- reset_n
            ledg_export   : out std_logic_vector(7 downto 0);                     -- export
            ledr_export   : out std_logic_vector(15 downto 0);                    -- export
            sw_export     : in  std_logic_vector(15 downto 0) := (others => 'X')  -- export
        );
    end component nios_core;
begin
--  Structural coding
    u0 : component nios_core
        port map (
            clk_clk       => CLOCK_50,       --   clk.clk
            reset_reset_n => KEY(0), -- reset.reset_n
            ledg_export   => LEDG(7 downto 0),   --  ledg.export
            ledr_export   => LEDR(15 downto 0),   --  ledr.export
            sw_export     => SW(15 downto 0)     --    sw.export
        );
end;