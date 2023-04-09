require 'Minitest/autorun'
require 'Minitest/reporters'
MiniTest::Reporters.use!

class List
  def initialize(*args)
    @list = args
  end

  def process
    yield(@list) if block_given?
    self
  end
end

class ListTest < Minitest::Test
  def test_same
    list1 = List.new(1, 2, 3)
    list2 = list1.process

    assert_same list1, list2
  end
end
