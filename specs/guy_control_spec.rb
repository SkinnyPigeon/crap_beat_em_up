require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../guy'
require_relative '../arena'
require_relative '../game'
require_relative '../guy_control'

class TestGuyControl < MiniTest::Test

  def setup
    @guy1=Guy.new("Poo", "💩", 3)
    @guy2=Guy.new("Ghost", "👻", 4)
    @players = [@guy1, @guy2]
    @arena=Arena.new(7)
    @game=Game.new(@players, @arena)
  end

end
