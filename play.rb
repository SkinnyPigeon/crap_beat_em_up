require_relative 'guy'
require_relative 'arena'
require_relative 'game'
require 'pry-byebug'


class Play


  attr_reader(:game, :arena, :players)

  def initialize(game, arena, players)
    @game = game
    @arena = arena
    @players = players


    @guy1=Guy.new("Poo", "💩", 3)
    @guy2=Guy.new("Ghost", "👻", 4)
    @players = [@guy1, @guy2]
    @arena=Arena.new(7)
    @game=Game.new(@players, @arena)

  end

  def run
    @arena=Arena.new(7)
    @game=Game.new(@players, @arena)
    @arena.spawn_players(@guy1, @guy2)
    binding.pry
  end

end


# @play=Play.new(@game, @arena, @players)
# @play.run()