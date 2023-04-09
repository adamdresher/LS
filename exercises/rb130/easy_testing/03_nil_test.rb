require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class ValueTest < Minitest::Test
  def test_nil
    value = nil
    assert_nil value
  end

  # using assert_equal to test nil values is deprecated
  # this will fail in Minitest 6
  def test_equal_nil
    value = nil
    assert_equal nil, value

    value = false
    refute_equal nil, value
  end
end
