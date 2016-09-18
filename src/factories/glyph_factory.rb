require_relative "../models/glyph.rb"

class GlyphFactory
  def initialize(symbol_map: {})
    @symbols = symbol_map
  end

  def create_glyph(symbol: " ")
    return Glyph.new(symbol: symbol)
  end
end
