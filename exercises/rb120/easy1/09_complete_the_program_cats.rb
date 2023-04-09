class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, fur)
    super(name, age)
    @fur = fur
    # overriding Pet's implementation of initialize is necessary to initialize
    # @fur.  Adding this instance variable to Pet is another viable approach, 
    # however it would have the side-effect of giving this state to all Pet 
    # instances.  This may be undesirable, depending on the types of pets (eg, 
    # birds, fish, reptiles, etc).
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@fur} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
# => My cat Pudding is 7 years old and has black and white fur.
# => My cat Butterscotch is 10 years old and has tan and white fur.
