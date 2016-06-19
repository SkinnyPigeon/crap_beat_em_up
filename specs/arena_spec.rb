require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../arena'
require_relative '../guy'

class TestArena < MiniTest::Test

  def setup
    @arena=Arena.new(7)
    @guy1=Guy.new("Poo", "💩", 3)
    @guy2=Guy.new("Ghost", "👻", 5)
  end

  def test_arena_is_there
    assert_equal(7, @arena.size)
  end

  def test_players_spawn_in_arena
    binding.pry
    @arena.spawn_players(@guy1, @guy2)
    assert_equal(@guy1, @arena.state[3])
  end


end
