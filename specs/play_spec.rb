require 'minitest/autorun'
require 'minitest/rg'
require_relative '../arena'
require_relative '../guy'
require_relative '../game'

class TestArena < MiniTest::Test

  def setup
    @arena=Arena.new(12)
    @guy1=Guy.new("Poo", "💩")
    @game=Game.new(@guy1, @arena)
  end



end