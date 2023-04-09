class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi.  You can call me #{@name}."
  end
end

kitty = Cat.new('Sophie')
kitty.greet # => Hi.  You can call me Sophie.
