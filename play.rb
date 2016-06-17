require 'guy_1'
require 'arena'

class Game

  attr_reader(:current_player, :winner, :log)

  def initialize(players, arena)
    @players = players
    @arena = arena
    @current_player = players[0]
    @winner = nil
    @log = []
  end




end