=begin
class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    tasks = tasks.select do |task|
      task.priority == :high
    end

    display(high_priority_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks
# =end

=begin
Line 78 raises an `Exception` due to the method
`TaskManager#display_high_priority_tasks` attempting to initialize a local
variable to the same name as an getter method, `tasks`.  However the local
variable `tasks` is actually assigned to itself as Ruby checks variable
referencing first, then method referencing.  And because the local variable
`tasks` has not yet been defined, it has a default value of `nil`.  This results
in `nil` calling `#select`, which is not available to `NilClass` objects and
raises a `NoMethodError`.
This can be resolved by choosing a different local variable name, such as
`high_priority_tasks`.
Other resolutions include defining the getting method with parentheses;
prepending the getting method with `self`; referencing the instance variable,
`@tasks`.
=end

class TaskManager

  # ...

  def display_high_priority_tasks
    high_priority_tasks = tasks.select do |task|
    # tasks = tasks().select do |task|
    # tasks = self.tasks.select do |task|
    # tasks = @tasks.select do |task|
      task.priority == :high
    end

    display(high_priority_tasks)
  end

  # ...

end

class Task

  # ...

  def to_s
    "[#{priority.to_s.center(6)}] #{name}"
  end
end
