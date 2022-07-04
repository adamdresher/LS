# class Dog
#   def speak
#     "bark!"
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = Dog.new
# puts teddy.speak # => 'bark!'
# puts teddy.swim # => 'swimming!'
# rosie = Bulldog.new
# puts rosie.speak # => 'bark!'
# puts rosie.swim # => "can't swim!"

################################################################################

class Animal
  def speak
    'bark!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

dude = Dog.new
puts dude.fetch # => 'fetching!'
puts dude.speak # => 'bark!'

noodle = Cat.new
puts noodle.run # => 'running!'
puts noodle.speak # => 'meow!'
puts noodle.swim # (NoMethodError)

################################################################################

=begin
class hierarchy:
 BasicObject
     |
   Kernel
     |
   Object
     |
   Animal
   /   \
 Cat   Dog

class hierarchy (class Bulldog included):
 BasicObject
     |
   Kernel
     |
   Object
     |
   Animal
   /   \
 Cat   Dog
        \
        Bulldog
=end

################################################################################

=begin
method lookup path for Cat:
- Cat
- Animal
- Object
- Kernel
- BasicObject

method lookup path for Bulldog:
- Bulldog
- Dog
- Animal
- Object
- Kernel
- BasicObject
=end

################################################################################

