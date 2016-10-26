class Window
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def clear_line
    print "\r\e[K"
  end

  def move_cursor_up
    print "\e[A"
  end

  def clear_window
    height.times do
      move_cursor_up
      clear_line
    end
  end

  def full_clear_window
    print "\e[2J"
  end
end
