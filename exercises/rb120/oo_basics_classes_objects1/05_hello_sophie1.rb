class Cat
  def initialize(name)
    @name = name
    puts "Call me #{@name}."
  end
end

kitty = Cat.new('Sophie') # => Call me Sophie.
