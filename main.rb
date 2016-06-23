require_relative("arena")
require_relative("game")
require_relative("guy")
# require_relative("random_text")


@guy1=Guy.new("Poo", "💩", 3)
@guy2=Guy.new("Ghost", "👻",6)
@players = [@guy1, @guy2]
@arena=Arena.new(8)
@game=Game.new(@players, @arena)
@arena.spawn_players(@guy1,@guy2)
@game.random_start
# @random_text=Text.new()

def run
  while @game.win? == false
    
    system"clear"
    puts
    puts "#{@guy1.name}'s Health: #{@guy1.health}         #{@guy2.name}'s Health: #{@guy2.health} "
    puts "#{@guy1.name}'s Energy: #{@guy1.energy}         #{@guy2.name}'s Energy: #{@guy2.energy} "
    puts 
    puts 
    print "#{@arena.state.join(" ")}"
    puts
    puts
    puts "#{@game.current_player.name} Please enter your move : "
    hit = gets.chomp
    case 
      when hit == " "
        @game.current_player.end_turn(@game)
        @game.update_stats

      when hit == "w" || hit == "p"
        @game.current_player.punch(@game.current_player, @game.other_player, @arena.state)
        @game.update_stats

      when hit == "q" || hit == "o"
        @game.current_player.block(@game.current_player)
        @game.update_stats

      when hit == "s" || hit == ";"
        @game.current_player.kick(@game.current_player, @game.other_player, @arena.state)
        @game.update_stats

      when hit == "e" || hit == "["
        @game.current_player.special(@game.current_player, @game.other_player, @arena.state)
        @game.update_stats

      when hit == "a" || hit == "l"
        @game.current_player.move_left(@game.current_player, @arena)
        @game.update_stats

      when hit == "d" || hit == "'"
        @game.current_player.move_right(@game.current_player, @arena)
        @game.update_stats

      when hit == "z" || hit == ","
        @game.current_player.dash_left(@game.current_player, @arena, @game)
        
      when hit == "c" || hit == "/"
        @game.current_player.dash_right(@game.current_player, @arena, @game)
      end
  end
  puts "Congratulations #{@game.current_player.icon}"
end



run
