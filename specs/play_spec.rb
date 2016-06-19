require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../guy'
require_relative '../arena'
require_relative '../game'
require_relative '../play'

class TestPlay < MiniTest::Test

  def setup
    @guy1=Guy.new("Poo", "💩", 3)
    @guy2=Guy.new("Ghost", "👻", 4)
    @players = [@guy1, @guy2]
    @arena=Arena.new(7)
    @game=Game.new(@players, @arena)
    @play=Play.new(@game, @arena, @players)
  end

  def test_play_works
    @play.run
    # binding.pry
    assert_equal(false, @game.win?)
  end



end