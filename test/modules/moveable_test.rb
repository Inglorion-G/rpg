require 'minitest/spec'
require 'minitest/autorun'
require_relative '../../src/modules/moveable'

describe Moveable do
  before do
    @moveable = Object.new
    @moveable.extend(Moveable)
  end

  describe "position tracking" do
    it "has an attribute 'position" do
      refute_nil @moveable.position
    end

    it "is defaults to position `[0, 0]`" do
      assert_equal [0, 0], @moveable.position
    end

    describe "#move" do
      coordinate = [1, 5]
      it "can be moved to a given coordinate" do
        @moveable.move(coordinate)
        assert_equal coordinate, @moveable.position
      end
    end
  end
end
