require 'simplecov'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!
SimpleCov.start

require_relative '../lesson1/todo_list'

class TodoListTest < MiniTest::Test

  def setup # setup is run before each test, meaning mutating objects won't affect other tests
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a) # explicitly tests the mutated contents
    # assert_equal(2, @list.size) # implicitly tests the contents
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_add_non_Todo_raises_error
    assert_raises(TypeError) { @list.add 'invalid obj' }
    assert_raises(TypeError) { @list.add 0 }
    assert_raises(TypeError) { @list.add Array.new }
    assert_raises(TypeError) { @list.add Hash.new }
  end

  def test_shovel # cannot use << in a method name
    new_todo = Todo.new('Walk Dude')
    @list << new_todo

    assert_includes(@list.to_a, new_todo)
  end

  def test_add_alias
    new_todo = Todo.new('Prepare lunch')
    @list.add new_todo
    @todos << new_todo

    assert_equal(@list.to_a, @todos)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at 10 }
    assert_equal(@todo1, @list.remove_at(0))
    refute_includes(@list.to_a, @todo1)
    assert_includes(@list.to_a, @todo2)
    assert_includes(@list.to_a, @todo3)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1) )
    assert_raises(IndexError) { @list.item_at 10 }
  end

  def test_find_by_title
    todo = @list.find_by_title @todo1.title
    assert_equal(@todo1, todo)
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at 10 }

    @list.mark_done_at 0

    assert_equal(true, @list.first.done?)
    assert_equal(false, @list.item_at(1).done?) # is it acceptable practice to use methods being tested within other tests?
    assert_equal(false, @list.last.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at 10 }

    @list.done!
    @list.mark_undone_at 2

    assert_equal(true, @list.first.done?)
    assert_equal(true, @list.item_at(1).done?)
    assert_equal(false, @list.last.done?)
  end

  def test_done? # is test_done? or test_done_question more appropriate?
    assert_equal(false, @list.done?)

    @list.done!

    assert_equal(true, @list.done?)
  end

  def test_done! # is test_done! or test_done_bang more appropriate?
    @list.done!
    @todos.each { |todo| todo.done! }

    assert_equal(@list.to_a, @todos)
  end

  def test_all_done
    @list.mark_done_at 0
    assert_equal([@todo1], @list.all_done.to_a)
    @list.done!
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
    @list.mark_all_undone
    assert_equal([], @list.all_done.to_a)
  end

  def test_all_not_done
    @list.done!
    @list.mark_undone_at 0
    assert_equal([@todo1], @list.all_not_done.to_a)
    @list.done!
    assert_equal([], @list.all_not_done.to_a)
    @list.mark_all_undone
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
  end

  def test_mark_done
    todo1 = @list.mark_done 'Buy milk'
    assert_equal(@todo1.done?, todo1)
    assert_equal([@todo1], @list.all_done.to_a)
    assert_nil(@list.mark_done 'Eat ice cream')
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal([], @list.all_done.to_a)
  end

  def test_to_s # prepending whitespaces in HEREDOC are required for this test
    # checks to_s with all undone
    output = <<~OUTPUT.chomp
      #{"Today's Todos".center(22)}
      -----------------------------------
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    # checks to_s with one todo done
    @todo2.done!

    output = <<~OUTPUT.chomp
      #{"Today's Todos".center(22)}
      #{'-' * 35}
      #{@todo1.to_s}
      #{@todo2.to_s}
      #{@todo3.to_s}
    OUTPUT

    assert_equal(output, @list.to_s)

    # checks to_s with all todos done
    @list.done!

    output_all_done = <<~OUTPUT.chomp
      #{"Today's Todos".center(22)}
      #{'-' * 35}
      #{@todo1.to_s}
      #{@todo2.to_s}
      #{@todo3.to_s}
    OUTPUT

    assert_equal(output_all_done, @list.to_s)
  end

  def test_each
    assert_equal(@list, @list.each) # checks return value

    result = []
    @list.each { |todo| result << todo }

    assert_equal([@todo1, @todo2, @todo3], result) # checks iterated elements
    # @list.each { |todo| assert_includes(@todos, todo) } # does not handle duplicate elements
  end

  def test_select
    all_selected = @list.select { |todo| !todo.done? }

    refute_equal(@list, all_selected) # checks return value

    new_list = TodoList.new(@list.title)
    new_list << @todo1
    @todo1.done!
    result = @list.select { |todo| todo.done? }

    assert_equal(new_list.to_s, result.to_s) # to_s checks Todo collaborators and title
  end
end
