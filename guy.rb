require 'pry-byebug'
require_relative 'arena'
require_relative 'game'

class Guy

  attr_reader(:name, :icon, :health, :energy, :starting_position, :position, :bonus, :block, :super)

  def initialize(name, icon, position)
    @name = name
    @icon = icon
    @health = 5
    @energy = 3
    @position = position
    @bonus = 0
    @block = 0
    @super = 0
  end

  
  def move(spaces)
    @position += spaces
  end

  def move_energy(bars)
    @energy -= (bars)
  end

  def hurt(health)
    @health += @block
    @health -= health
    @health -= @block
    @block = 0
  end  


  def block
      @block = 0
    block = gets.chomp
    if block == "q" || block == "o"
      @block = 2
    end
  end 

  def chance_of_bonus_damage(guy)
    chance = rand(20)
    if chance > 16
      return @bonus = 2
    else
      return @bonus = 1
    end
  end


  def pain(bonus)
    @health += @block 
    @health -= bonus
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
    guy1.chance_of_bonus_damage(guy1)
    hit = gets.chomp
    if hit == "s" || hit == ";"
      guy2.pain(@bonus)
      guy1.move_energy(2)
    end
  end





end
