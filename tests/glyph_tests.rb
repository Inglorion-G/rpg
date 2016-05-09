require 'minitest/spec'
require 'minitest/autorun'

require_relative '../src/models/glyph.rb'
require_relative '../src/factories/glyph_factory.rb'

describe Glyph do

  before do
    @glyph = Glyph.new(symbol: '@')
  end

  it "must have a symbol instance variable" do
    @glyph.instance_variable_defined?(:@symbol).must_equal true
  end

  it "must not allow access to instance variables" do
    ->{ @glyph.symbol }.must_raise NoMethodError
  end
  
end

describe GlyphFactory do

  before do
    @glyph_factory = GlyphFactory.new
  end

  it "creates a Glyph object" do
    @glyph_factory.build_glyph.must_be_instance_of Glyph
  end
end