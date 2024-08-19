library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram is
port (
		din : in std_logic_vector(9 downto 0);
		addr : in std_logic_vector(7 downto 0);
		rst, en, we : in std_logic;
		clk : in std_logic;
		dout : out std_logic_vector(9 downto 0));
end entity ram;

architecture behavioral of ram is

begin

process(clk)
type std_vector_array is array (255 downto 0) of std_logic_vector(9 downto 0);
variable ram_array : std_vector_array;

variable addr_var : INTEGER := 0;
variable output : std_logic_vector(9 downto 0);
variable reserved_floors : std_logic_vector(4 downto 1) := "0000";
begin
	if rising_edge(Clk) then
		if rst = '1' then
			for i in 255 downto 0 loop
				ram_array(i) := "0000000000";
			end loop;
		end if;
		if rst = '0' and en = '1' then
			if we = '1' then 
				ram_array(to_integer(signed(addr))) := din;
				output := "XXXXXXXXXX";
			else
				output := ram_array(to_integer(signed(addr)));
			end if;
		end if;
		dout <= output;
	end if;
end process;
end behavioral;