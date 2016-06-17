require 'minitest/autorun'
require 'minitest/rg'
require_relative '../arena'
require_relative '../guy'

class TestArena < MiniTest::Test

  def setup
    @arena=Arena.new(12)
    @guy1=Guy.new("Poo", "💩", 3)
  end

  def test_arena_is_there
    assert_equal(12, @arena.size)
  end

end
