class Item
  attr_reader :name, :value

  def initialize(name: nil, value: nil)
    @name = name
    @value = value
  end
end
