require_relative("arena")
require_relative("game")
require_relative("guy")
require("pry-byebug")

@guy1=Guy.new("Poo", "💩", 3)
@guy2=Guy.new("Ghost", "👻",4)
@players = [@guy1, @guy2]
@arena=Arena.new(8)
@game=Game.new(@players, @arena)
@arena.spawn_players(@guy1,@guy2)

def run
  while @game.win? == false
    
    system"clear"
    puts "Left: A or L   Right: D or '   Punch: W or P   Kick: S or ;   Block: Q or O   Super: E or [ "
    puts "1 Energy       1 Energy        1 Energy        2 Energy       2 Energy        3 Energy"
    puts
    puts
    puts
    puts
    puts "#{@guy1.name}'s Health: #{@guy1.health}         #{@guy2.name}'s Health: #{@guy2.health} "
    puts "#{@guy1.name}'s Energy: #{@guy1.energy}         #{@guy2.name}'s Energy: #{@guy2.energy} "
    puts 
    print @arena.state
    puts
        puts "#{@game.current_player.name} Please enter your move : "
    hit = gets.chomp
    case 
      when hit == " "
        @game.current_player.end_turn(@game)
        @game.update_stats
      when hit == "w" || hit == "p"
        binding.pry
        nil
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
      end
  end
end



run
