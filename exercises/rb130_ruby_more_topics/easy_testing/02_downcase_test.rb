require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class ValueTest < Minitest::Test
  def test_downcase
    value = 'xyz'
    assert_equal(true, value.downcase)
  
    value = 'Xyz'
    assert_equal(false, value.downcase)
  end
end