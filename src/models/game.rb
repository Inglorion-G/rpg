class Game

  attr_accessor :object_locations, :objects, :player
  attr_reader :formatter, :key_mapper, :stop, :parser, :key_mapper

  protected :stop, :parser

  def initialize(map: map, formatter: formatter, parser: parser, key_mapper: key_mapper)
    @player = nil
    @stop = false
    @map = map
    @key_mapper = key_mapper
    @formatter = formatter
    @parser = parser
    @objects = {}
    @object_locations = {}
    @object_locations.merge!(@map.map_hash)

    self.update_locations
  end

  def run_game
    until @stop
      formatter.clear_window
      print @map.draw(15, 15, @object_locations)
      self.handle_input
      self.update_locations
    end
  end

  def stop_game
    stop = true
  end

  def update_locations
    @objects.each do |key, obj|
      current_location = @object_locations.select { |key, value| value == obj.name.to_sym }.keys[0]
      if @object_locations[obj.location] != :empty || @object_locations[obj.location] == nil
        obj.location = current_location
        next
      elsif @object_locations[obj.location] != obj.name.to_sym
        @object_locations[obj.location] = obj.name.to_sym
        @object_locations[current_location] = :empty
      end
    end
  end

  def prompt_user
    puts "What would you like to do?"
    response = gets.chomp
    parser.parse_response(response)
  end

  def handle_input()
    c = key_mapper.read_char
    case c
      when "\e[A"
        @player.move(:north)
      when "\e[B"
        @player.move(:south)
      when "\e[C"
        @player.move(:east)
      when "\e[D"
        @player.move(:west)
      when "\e[3~"
        @stop = true
      when "\r"
        self.prompt_user
      when " "
        @player.attack
      else
        puts c.inspect
    end
  end
end