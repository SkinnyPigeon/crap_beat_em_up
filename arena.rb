class Arena

  attr_accessor(:size, :state)


  def initialize(size)
    @state = Array.new(size, "_")
  end

  def size
    return @state.length
  end


  def spawn_players(guy1, guy2)
    @state.insert(guy1.position, guy1.icon)  && @state.insert(guy2.position, guy2.icon)
  end

  def view(arena)
    print arena.state
  end

end