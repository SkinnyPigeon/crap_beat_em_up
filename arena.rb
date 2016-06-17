class Arena

  attr_accessor(:size)


  def initialize(size)
    @state = Array.new(size, 0)
  end

  def size
    binding.pry
    return @state.length
  end


end
