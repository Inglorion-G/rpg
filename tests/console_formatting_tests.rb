require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/console_formatter.rb'

##
# Notes:
# I want to read in multiple lines of console output and compare it to 
# expected values. There may be several ways to accomplish this
#
# 1) IO might have some mechanism for reading all of STDOUT
# 2) Write to a temporary file and seek through that file

describe ConsoleFormatter do
  
  before do
    @formatter = ConsoleFormatter.new(10, 10)
  end

  it "must be an instance of ConsoleFormatter" do
    @formatter.must_be_instance_of ConsoleFormatter
  end

  it "can must be created with a width and height" do
    @formatter.instance_variable_defined?(:@window_height).must_equal true
    @formatter.instance_variable_defined?(:@window_width).must_equal true
  end

  it "can clear one line of console output" do
    puts "one line"
    @formatter.move_cursor_up
    @formatter.clear_line
  end

  it "can clear multiple lines of console output" do
    10.times { puts "----------"}
    @formatter.clear_window
  end

end