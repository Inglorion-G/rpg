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

  it "must be created with a width and height" do
    assert_respond_to @window, :height
    assert_respond_to @window, :width
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
