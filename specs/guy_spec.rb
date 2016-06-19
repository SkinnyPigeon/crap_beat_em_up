require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../guy'
require_relative '../arena'
require_relative '../play'

class TestGuy < MiniTest::Test

  def setup
    @guy1=Guy.new("Poo", "💩", 3)
    @guy2=Guy.new("Ghost", "👻", 4)
    @players = [@guy1, @guy2]
    @arena=Arena.new(12)
    @game=Game.new(@players, @arena)
  end

  def test_guy_has_name
    assert_equal("Poo", @game.current_player.name)
  end

  def test_guy_has_icon
    assert_equal("💩", @game.current_player.icon)
  end

  def test_guy_has_health
    assert_equal(5, @game.current_player.health)
  end

  def test_guy_has_energy
    assert_equal(3, @game.current_player.energy)
  end

  
  def test_guy_has_position
    assert_equal(3, @game.current_player.position)
  end

  def test_guy_moves_left
    @game.current_player.move_left(@game.current_player, @arena)
    assert_equal(2, @game.current_player.position)
  end

  # def test_guy_gets_kicked
  #   @game.current_player.kick(@game.current_player, @game.other_player)
  #   assert_equal(4, @game.other_player.health)
  # end


  # def test_random_generator
  #   assert_equal(1, @guy1.chance_of_bonus_damage(@guy1))
  # end


  # def test_guy_can_block
  #   assert_equal(5, @guy1.block(@guy1, @guy2))
  # end

end






# def test_guy_moves_right
#   assert_equal(4, @guy1.move_right(@guy1))
# end

# def test_guy_gets_punched
#   assert_equal(4, @guy1.punch(@guy2))
# end







