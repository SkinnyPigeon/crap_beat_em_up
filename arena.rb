class Arena

  attr_accessor(:size)


  def initialize(size)
    @state = Array.new(size, 0)
  end

  def size
    return @state.length
  end

  def set_up_positions(positions)
    for key in positions.keys
      @state[key] = positions[key]
    end
  end

end
