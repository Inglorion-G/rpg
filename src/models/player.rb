require_relative 'inventory'

class Player
  include Moveable

  attr_reader :name

  def initialize(name: "player_1")
    @name = name
    @inventory = Inventory.new
  end
end
