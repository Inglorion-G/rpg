require 'minitest/spec'
require 'minitest/autorun'
require_relative '../src/models/player'

describe Player do
  before do
    @player = Player.new
  end

  it "is initialized with a default name" do
    assert_equal "player_1", @player.name
  end

  it "can be initialized with a custom name" do
    @player = Player.new(name: "Tyrion")

    assert_equal "Tyrion", @player.name
  end
end
