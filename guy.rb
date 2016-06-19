require 'pry-byebug'
require_relative 'arena'
require_relative 'game'

class Guy

  attr_reader(:name, :icon, :health, :energy, :starting_position, :position, :opponent_bonus, :block, :opponent_special)

  def initialize(name, icon, position)
    @name = name
    @icon = icon
    @health = 5
    @energy = 3
    @position = position
    @opponent_bonus = 0
    @block = 0
    @opponent_special = 3
  end


  def can_move(guy1)
    return if @energy >= 1 
  end


  def move(spaces)
    @position += spaces
  end

  def move_energy(bars)
    @energy -= (bars)
  end


  def movement(guy, arena)
    move = gets.chomp

    if move == "d" || move == "'"
      arena.state.delete_at(guy.position)
      guy.move(1)
      guy.move_energy(1)
      arena.state.insert(guy.position, guy)

    else move == "a" || move == "l"
      arena.state.delete_at(guy.position)
      guy.move(-1)
      guy.move_energy(1)
      arena.state.insert(guy.position, guy)
    end
  end


  def block(guy1)
    hit = gets.chomp
    if hit == "q" || hit == "o"
      @block = 2
      guy1.move_energy(2)
    end
  end 


  def punch_setup(units)
    @block -= units
    if @block < 0
      @health += @block
    end
    @block = 0
  end  

  def punch(guy1, guy2)
    hit = gets.chomp
    if hit == "w" || hit == "p"
      guy2.punch_setup(1)
      guy1.move_energy(1)
    end
  end  


  def chance_of_bonus_kick_damage
    chance = rand(20)
    if chance > 19
      return @opponent_bonus = 3
    elsif chance > 14
      return @opponent_bonus = 2
    else
      return @opponent_bonus = 1
    end
  end

  def kick_setup
    @block -= @opponent_bonus
    if @block < 0
      @health += @block
    end
    @block = 0
  end

  def kick(guy1, guy2)
    guy2.chance_of_bonus_damage
    hit = gets.chomp
    if hit == "s" || hit == ";"
      guy2.kick_setup
      guy1.move_energy(2)
      @opponent_bonus = 0
    end
  end


  def special_setup
    @block -= @opponent_special
    if @block < 0
      @health += @block
    end
    @opponent_special = 0
    @block = 0
  end

  def special(guy1, guy2)
    hit = gets.chomp
    if hit == "e" || hit == "["
      guy2.special_setup
      guy1.move_energy(3)
    end
  end


  def end_turn(game)
    hit = gets.chomp
    if hit == " "
      game.turn_ended 
    end
  end

  def add_energy
    @energy += 1
  end

end

a=Guy.new("a", "@", 3)
b=Guy.new("b", "!", 4)
