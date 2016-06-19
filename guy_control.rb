require 'pry-byebug'
require_relative 'guy'
require_relative 'arena'
require_relative 'game'

class GuyControl

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

  system"clear"
  puts "Left: a or l   Right: d or '   Punch: w or p   Kick: s or ;   Block: q or o   Super: e or [ "
  puts "Please enter your move: "
  hit = gets.chomp

  def moveset
    case input

      when hit == "w" || hit == "p"
        @game.current_player.punch(@game.current_player, @game.other_player)

      when hit == "q" || hit == "o"
        @game.current_player.block(@game.current_player)
      when hit == "s" || hit == ";"

        @game.current_player.kick(@game.current_player, @game.other_player)

      when hit == "e" || hit == "["
        @game.current_player.special(@game.current_player, @game.other_player)

      when hit == "a" || hit == "l"
        @game.current_player.move_left(@game.current_player, @arena)

      when hit == "d" || hit == "'"
        @game.current_player.move_right(@game.current_player, @arena)

      when hit == " "
        @game.current_player.end_turn(@game)
      end

  end



end