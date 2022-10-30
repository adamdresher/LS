require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class ValueTest < Minitest::Test
  # def test_odd?
  #   assert(value.odd?) @ tests for an a truthy value
  # end

  def test_odd?
    value = 1
    assert_equal(true, value.odd?)

    value = 2
    assert_equal(false, value.odd?)
  end
end
