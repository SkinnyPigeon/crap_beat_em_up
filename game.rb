require_relative 'guy'
require_relative 'arena'

class Game

  attr_reader(:current_player, :other_player, :winner, :log)

  def initialize(players, arena)
    @players = players
    @arena = arena
    @current_player = players[0]
    @other_player = players[1]
    @winner = nil
    @log = []
  end

  def turn_ended
    @current_player = @players.rotate![0]
    if @current_player.energy == 3
      return
    else @current_player.add_energy
    end
  end

  def win?
    return @other_player.health <= 0
  end

  def update_stats
    return @current_player.health && @other_player.energy
  end


end
# game=Game.new(players, arena)