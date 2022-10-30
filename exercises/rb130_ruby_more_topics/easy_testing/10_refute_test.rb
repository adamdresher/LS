require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class ArrayTest < Minitest::Test
  def test_includes
    list = []

    refute_includes list, 'xyz'
  end
end
