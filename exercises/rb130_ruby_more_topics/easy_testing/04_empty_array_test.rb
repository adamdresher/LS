require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class ArrayTest < Minitest::Test
  def test_empty
    list = []
    # assert_equal true, list.empty?
    assert_empty list
  end
end
