require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../guy'
require_relative '../arena'

class TestGuy < MiniTest::Test

  def setup
    @guy1=Guy.new("Poo", "💩", 3)
    @guy2=Guy.new("Ghost", "👻", 4)
    @arena=Arena.new(12)
  end

  def test_guy_has_name
    assert_equal("Poo", @guy1.name)
  end

  def test_guy_has_icon
    assert_equal("💩", @guy1.icon)
  end

  def test_guy_has_health
    assert_equal(5, @guy1.health)
  end

  def test_guy_has_energy
    assert_equal(3, @guy1.energy)
  end

  
  def test_guy_has_position
    assert_equal(3, @guy1.position)
  end

  def test_guy_gets_kicked
    # @guy1.chance_of_bonus_damage(@guy1)
    assert_equal(4, @guy1.kick(@guy1,@guy2))
  end



end


# def test_random_generator
#   assert_equal(4, @guy1.chance_of_bonus_damage)
# end

# def test_guy_moves_left
#   assert_equal(2, @guy1.move_left(@guy1))
# end

# def test_guy_moves_right
#   assert_equal(4, @guy1.move_right(@guy1))
# end

# def test_guy_gets_punched
#   assert_equal(4, @guy1.punch(@guy2))
# end







