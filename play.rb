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
  end


end