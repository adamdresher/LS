require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class ArrayTest < Minitest::Test
  def test_include
    list = []
    refute_includes list, 'xyz'
    list = ['xyz']
    assert_includes list, 'xyz'
  end
end