module Moveable
  def position
    @position ||= [0, 0]
  end

  def position=(x, y)
    @position[0] = x
    @position[1] = y
  end

  def move(coordinates)
    @position = coordinates
  end
end
