require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class NumericTest < Minitest::Test
  def test_class
    value = Numeric.new
    assert_instance_of Numeric, value # value can be an instance of a superclass of Numeric
    # assert_same Numeric, value.class # value cannot be an instance of a superclass of Numeric
  end
end
