require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class NumericTest < Minitest::Test
  def test_kind_of_Numeric
    value1 = Numeric.new
    value2 = 42
    value3 = 8.09

    assert_kind_of Numeric, value1
    assert_kind_of Numeric, value2
    assert_kind_of Numeric, value3
  end

  def test_includes
    value1 = Numeric
    value2 = Integer
    value3 = Float

    assert_includes value1.ancestors, Numeric
    assert_includes value2.ancestors, Numeric
    assert_includes value3.ancestors, Numeric
  end
end
