require_relative "../models/glyph.rb"

class GlyphFactory

  def initialize(symbol_map: nil)
    @symbols = symbol_map
  end

  def build_glyph
    return Glyph.new
  end

end