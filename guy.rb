require 'pry-byebug'

class Guy

  attr_reader(:name, :icon, :health, :energy, :starting_position, :position)

  def initialize(name, icon, position)
    @name = name
    @icon = icon
    @health = 5
    @energy = 3
    @position = position
  end

  
  def move(spaces)
    @position += spaces
  end

  def hurt(health)
    @health -= health
  end


  def move_left(guy)
    move = gets.chomp
    if move == "a"
      guy.move(-1)
    end
  end  

  def move_right(guy)
    move = gets.chomp
    if move == "d"
      guy.move(1)
    end
  end

  def punch(guy)
    hit = gets.chomp
    if hit == "w"
      guy.hurt(1)
    end
  end  

  def kick(guy)
    hit = gets.chomp
    if hit == "s"
      guy.hurt(2)
    end
  end



end
