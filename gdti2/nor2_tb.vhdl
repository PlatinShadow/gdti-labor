library ieee;
use ieee.std_logic_1164.all;

entity nor2_tb is end nor2_tb;

architecture behav of nor2_tb is
  component nor2
    port ( a, b: in std_logic;   y : out std_logic);
  end component;
  signal in1, in2, result : std_logic;
begin
  nor2_0: nor2 port map (a=>in1, b=>in2, y=>result);

  process begin
    in1 <= '0';
    in2 <= '0';
    wait for 1 fs;
    assert result = '1' report "bad result for input 0 0" severity error;
    wait for 1 fs;

    in1 <= '0';
    in2 <= '1';
    wait for 1 fs;
    assert result = '0' report "bad result for input 0 1" severity error;
    wait for 1 fs;

    in1 <= '1';
    in2 <= '0';
    wait for 1 fs;
    assert result = '0' report "bad result for input 1 0" severity error;
    wait for 1 fs;

    in1 <= '1';
    in2 <= '1';
    wait for 1 fs;
    assert result = '0' report "bad result for input 1 1" severity error;
    wait for 1 fs;

    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behav;
