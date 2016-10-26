require 'minitest/spec'
require 'minitest/autorun'
require_relative '../src/models/inventory'
require_relative '../src/models/item'
require_relative '../src/models/currency'

describe Inventory do
  before do
    @inventory = Inventory.new
    @item = Item.new
  end

  describe "basic operations" do
    it "can add a single item" do
      @inventory.add(@item)

      assert_equal 1, @inventory.count
    end

    it "can remove a single item" do
      @inventory.add(@item)
      @inventory.remove(@item)

      assert_equal 0, @inventory.count
    end

    it "returns the item that was removed" do
      @inventory.add(@item)
      assert_equal @item, @inventory.remove(@item)
    end
  end

  describe "reporting about state of the store" do
    it "returns false if an item doesn't exist in the store" do
      refute @inventory.contains?(@item)
    end

    it "returns true if an item exists in the store" do
      @inventory.add(@item)

      assert @inventory.contains?(@item)
    end
  end

  describe "enforces validations about what can be added" do
    it "won't add the same item twice" do
      @inventory.add(@item)
      @inventory.add(@item)

      assert_equal 1, @inventory.count
    end

    it "raises an error if the item is not of class Item" do
      fake_item = Object.new

      assert_raises(RuntimeError) { @inventory.add(fake_item) }
    end
  end
end
