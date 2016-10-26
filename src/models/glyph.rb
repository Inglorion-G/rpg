class Glyph
  def initialize(name: nil, symbol: "@")
    @name = name
    @symbol = symbol
  end

  def draw
    print @symbol
  end
end
