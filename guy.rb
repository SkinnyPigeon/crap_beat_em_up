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

  
  def move(spaces)
    @position += spaces
  end

  def move_energy(bars)
    @energy -= (bars)
  end

  def hurt(health)
    @block -= health
    if @block < 0
      @health += @block
    end
    @block = 0
  end  


  def block
      @block = 0
    block = gets.chomp
    if block == "q" || block == "o"
      @block = 2
    end
  end 

  def chance_of_bonus_damage
    chance = rand(20)
    if chance > 19
      return @opponent_bonus = 3
    elsif chance > 14
      return @opponent_bonus = 2
    else
      return @opponent_bonus = 1
    end
  end


  def pain
    @block -= @opponent_bonus
    if @block < 0
      @health += @block
    end
    @block = 0
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


  def punch(guy1, guy2)
    hit = gets.chomp
    if hit == "w" || hit == "p"
      guy2.hurt(1)
      guy1.move_energy(1)
    end
  end  


  def kick(guy1, guy2)
    guy2.chance_of_bonus_damage
    hit = gets.chomp
    if hit == "s" || hit == ";"
      guy2.pain
      guy1.move_energy(2)
      @opponent_bonus = 0
    end
  end

  def opponent_special
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
      guy2.opponent_special
      guy1.move_energy(3)
    end
  end



end

a=Guy.new("a", "@", 3)
b=Guy.new("b", "!", 4)
