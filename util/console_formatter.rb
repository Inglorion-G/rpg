
class ConsoleFormatter
  attr_reader :window_width, :window_height

  def initialize(width, height)
    @window_width = width
    @window_height = height
  end

  def clear_line
    print "\r\e[K"
  end

  def move_cursor_up
    print "\e[A"
  end

  def clear_window
    window_height.times do
      move_cursor_up
      clear_line
    end
  end

end