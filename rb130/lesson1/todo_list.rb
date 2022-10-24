# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task) # rescue invalid arguments with TypeError
    raise TypeError.new("Can only add Todo objects") unless task.class == Todo
    # raise TypeError, 'Can only add Todo objects' unless task.instance_of? Todo # LS implementation

    todos.push(task)
  end
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def done?
    todos.all? { |task| task.done? }
  end

  def to_a
    todos.clone
  end

  def item_at(idx) # handles out of bounds index with IndexError
    raise IndexError if idx >= todos.size

    todos[idx]
    # todos.fetch(idx) # LS implementation, gives a default IndexError
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def done!
    todos.each { |task| task.done! }
  end

  def to_s
    display = title.center(22) + "\n"
    display << '-' * 35 + "\n"
    display << todos.join("\n")
  end

  def each
    counter = 0
    while todos.size > counter
      yield(todos[counter]) if block_given?
      counter += 1
    end
    self
  end

  # def each
  #   todos.each { |task| yield(task) } # LS implementation
  # end

  # def select # 1st approach
  #   todos.select { |task| yield(task) } # returns an Array object
  # end

  # def select # 2nd approach
  #   counter = 0
  #   selection = TodoList.new(title)
  #   while todos.size > counter
  #     selection << todos[counter] if yield(todos[counter])
  #     counter += 1
  #   end
  #   selection
  # end

  def select # 3rd approach
    selection = TodoList.new(title)
    todos.each do |task|
      selection << task if yield(task)
    end
    selection
  end

  def find_by_title(name)
    raise TypeError, "`name' must be a String object" unless name.instance_of? String

    todos.each { |task| return task if task.title == name }
    nil
  end

  def all_done
    select { |task| task.done? }
  end

  def all_not_done
    select { |task| !task.done? }
  end

  # def mark_done(name)
  #   raise TypeError, "`name' must be a String object" unless name.instance_of? String
  #   selected = todos.select { |task| task.title == name }
  #   selected.empty? ? nil : selected.first.done!
  # end

  def mark_done(name)
    item_found = find_by_title name
    find_by_title(name).done! if item_found
    # find_by_title(name) && find_by_title(name).done! # LS implementation
    # first `#find_by_title` short circuits the expression if there is no `Todo` object with a `@title` with a `name` value
    # this prevents `nil` invoking `#done!`, which would raise a `NoMethodError`
  end

  def mark_all_done
    each { |task| task.done! }
  end

  def mark_all_undone
    each { |task| task.undone! }
  end

  private

  attr_reader :todos
end

# --- Tests ----
# given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
# list.size                       # returns 3

# first
# list.first                      # returns todo1, which is the first item in the list

# last
# list.last                       # returns todo3, which is the last item in the list

#to_a
# list.to_a                      # returns an array of all items in the list

#done?
# list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(2)
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# done!
# list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
# list.shift                      # removes and returns the first item in list

# pop
# list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
# list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

# ---- Displaying list undone and done ----

# puts list
# puts list.done?
# puts
# list.done!
# puts list
# puts list.done?

# ---- Each ----

# list.each { |task| puts task }

# ---- Select ----

# list.mark_done_at(1)
# result = list.select { |task| task.done? }
# puts result.inspect

# ---- Find by title ----

# p list.find_by_title 'Buy milk'

# ---- All done ----

# puts list.all_done

# ---- All not done ----

# puts list.all_not_done

# ---- Mark done ----

# p list.mark_done 'Buy '
# puts list

# ---- Mark all done ----

# list.mark_all_done
# puts list

# ---- Mark all undone ----

# list.mark_all_undone
# puts list
