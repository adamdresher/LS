require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '08_text'

class TextTest < Minitest::Test
  def setup
    @sample = File.new('08_sample.txt', 'r')
    @text = Text.new @sample.read
  end

  def teardown
    @sample.close
    puts "File has been closed: #{@sample.closed?}"
  end

  def test_swap
    swapped_text = @text.swap('a', 'e')

    refute_match(/a/, swapped_text)
    assert_match(/e/, swapped_text)
  end

  def test_word_count
    counter = 72
    # another approach however this relies on the same logic it is testing
    # @sample.rewind # rewinds any reading from IO#read
    # counter = @sample.read.split(' ').count

    assert_equal(counter, @text.word_count)
  end
end
