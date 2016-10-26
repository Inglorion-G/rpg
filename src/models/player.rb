require_relative 'inventory'
require_relative '../modules/moveable'
class Player
  include Moveable

  attr_reader :name

  def initialize(name: "player_1")
    @name = name
  end
end
