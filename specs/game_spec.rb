require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../arena'
require_relative '../guy'
require_relative '../game'
# binding.pry

class TestArena < MiniTest::Test

  def setup
    @arena=Arena.new(7)
    @guy1=Guy.new("Poo", "💩", 3)
    @guy2=Guy.new("Ghost", "👻", 4)

    @players = [@guy1, @guy2]
    @game=Game.new(@players, @arena)


  end

  def test_current_player
    assert_equal(@guy1, @game.current_player)
  end

  def test_player_has_changed
    @game.turn_ended
    assert_equal(@guy2, @game.current_player)
  end

  def test_game_over
    assert_equal(false, @game.win?)
  end

  def test_player_regains_energy
    @game.turn_ended
    assert_equal(3, @game.current_player.energy)
  end


end