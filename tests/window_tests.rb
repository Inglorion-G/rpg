require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/window.rb'

##
# Notes:
# I want to read in multiple lines of console output and compare it to 
# expected values. There may be several ways to accomplish this
#
# 1) IO might have some mechanism for reading all of STDOUT
# 2) Write to a temporary file and seek through that file

describe Window do
  
  before do
    @window = Window.new(10, 10)
  end

  it "must be an instance of Window" do
    @window.must_be_instance_of Window
  end

  it "can must be created with a width and height" do
    @window.instance_variable_defined?(:@height).must_equal true
    @window.instance_variable_defined?(:@width).must_equal true
  end

  it "can clear one line of console output" do
    puts "one line"
    @window.move_cursor_up
    @window.clear_line
  end

  it "can clear multiple lines of console output" do
    10.times { puts "----------"}
    @window.clear_window
  end

end