require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '08_text'

class TextTest < Minitest::Test
  def setup
    @sample = File.new '08_sample.txt'
    @text = Text.new @sample.read
  end

  def teardown
    @sample.close
  end

  def test_swap
    swapped_text = @text.swap('a', 'e')

    refute_match(/a/, swapped_text)
    assert_match(/e/, swapped_text)
  end
end
