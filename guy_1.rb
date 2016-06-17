require 'pry-byebug'

class Guy

  attr_reader(:name, :icon, :health, :energy, :starting_position, :position)

  def initialize(name, icon)
    @name = name
    @icon = icon
    @health = 5
    @energy = 3
    @position = 3
  end

  
  def move(spaces)
    @position += spaces
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



end
