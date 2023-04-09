class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    # @name.upcase!
    # "My name is #{@name}."
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy' # 'Fluffy'
fluffy = Pet.new(name) # 'Fluffy'
puts fluffy.name # => 'Fluffy'
puts fluffy # => 'My name is FLUFFY.'
puts fluffy.name # => 'FLUFFY' # => 'Fluffy'
puts name # => 'FLUFFY' # => 'Fluffy'
=begin
The expression on line 9 caused the object, referenced by @name and name, to be 
mutated.  This resulted in the variable passed to the instantiation of Pet to 
also reference the mutated object.

By removing the mutating method upcase! and using upcase to create a new object,
@name and name are left unmodified.  This change helps keep the class 
encapsulated.
=end

name = 42 # 42
fluffy = Pet.new(name) # '42'
name += 1 # 43
puts fluffy.name # '42'
puts fluffy # 'My name is 42.'
puts fluffy.name # '42'
puts name # '43'
=begin
On line 32, the Integer 42 is passed to new and gives the new object it's first
state.  The string representation of the Integer 42 is assigned to @name.

On line 33, the local variable name is reassigned to itself plus 1.  This is 
reassignment, not mutation, so the local variable name is now referencing a 
different object then the one it passed to new.

On lines 34 - 36, the instantiated object referenced by fluffy continues to 
reference the String '42'.

On lines 34, 36, and 37, puts uses to_s to output a String representation of 
the String '42' or Integer 43.  The class Pet's implementation of to_s is not 
used because neither String nor Integer classes inherit from the Pet class.
=end
