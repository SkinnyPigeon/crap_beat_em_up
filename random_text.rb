require_relative('game')
require_relative('guy')
require_relative('arena')

class Text 


  attr_reader(:game, :players)

  def initialize



  end

  def punch_text
    chance = rand(6)
    case
    when chance == 1
      puts "#{@game.current_player.name} brings the pain"
    when chance == 2
      puts "#{@game.current_player.name} feints to the right then lands a monster left"
    when chance == 3
      puts "#{@game.current_player.name} switches to his elbows"
    when chance == 4
      puts "#{@game.current_player.name} goes for some ground and pound"
    when chance == 5
      puts "#{@game.current_player.name} throws a mighty right"
    when chance == 6
      puts "#{@game.current_player.name} has #{@game.other_player.name} on the ropes"
    end
  end
  #kicks
  puts "#{@game.current_player.name} unleashes a roundhouse"
  puts "#{@game.other_player.name} takes a merciless knee to the groin"
  puts "#{@game.current_player.name} kicks #{@game.other_player.name} straight in the jaw"
  puts "#{@game.current_player.name} brings his heel down with a crunch"
  puts "#{@game.current_player.name} makes #{@game.other_player.name} taste his toes"
  #special
  puts "#{@game.current_player.name} launches a fireball"
  puts "#{@game.current_player.name} sends bolts of lighting straight to the nips"
  puts "#{@game.current_player.name} rains fire down from above"
  puts "#{@game.current_player.name} summon's a powerful earthquake"
  #block
  puts "#{@game.current_player.name} brings his blocking game"
  puts "#{@game.current_player.name} could be on the ropes"
  puts "#{@game.current_player.name} is taking a breather"
  puts "#{@game.current_player.name} gets his guard up"
  puts "#{@game.current_player.name} expects a monster blow"

end

