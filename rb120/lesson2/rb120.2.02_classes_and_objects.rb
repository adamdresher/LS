# class Person
#   attr_accessor :name

#   def initialize(n)
#     @name = n
#   end
# end

# bob = Person.new('bob')
# p bob.name # => "bob"
# bob.name = "Robert"
# p bob.name # => "Robert"

################################################################################

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(first_n, last_n='')
#     @first_name = first_n
#     @last_name = last_n
#   end

#   def name
#     "#{@first_name} #{@last_name}".strip
#   end
# end

# bob = Person.new('Robert')
# p bob.name # => "Robert"
# bob.first_name # => "Robert"
# bob.last_name # => ""
# bob.last_name = "Smith"
# p bob.name # => "Robert Smith"

################################################################################

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parse_full_name(full_name)
#   end

#   def name=(full_name)
#     parse_full_name(full_name)
#   end

#   def name
#     "#{@first_name} #{@last_name}".strip
#   end

#   private

#   def parse_full_name(full_name)
#     name_parts = full_name.split

#     @first_name = name_parts.first
#     @last_name = name_parts.size > 1 ? name_parts.last : ''
#   end
# end

# bob = Person.new('Robert')
# p bob.name # => "Robert"
# p bob.first_name # => "Robert"
# p bob.last_name # => ""
# bob.last_name = "Smith"
# p bob.name # => "Robert Smith"

# bob.name = "John Adams"
# p bob.first_name # => "John"
# p bob.last_name # => "Adams"

################################################################################

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parse_full_name(full_name)
#   end

#   def name=(full_name)
#     parse_full_name(full_name)
#   end

#   def name
#     "#{@first_name} #{@last_name}".strip
#   end

#   private

#   def parse_full_name(full_name)
#     name_parts = full_name.split

#     @first_name = name_parts.first
#     @last_name = name_parts.size > 1 ? name_parts.last : ''
#   end
# end

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')
# p bob == rob # => false # they are two different objects
# p bob.name == rob.name # => true # they are two different Strings with the same
#                                  # String values

################################################################################

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parse_full_name(full_name)
#   end

#   def name=(full_name)
#     parse_full_name(full_name)
#   end

#   def name
#     "#{@first_name} #{@last_name}".strip
#   end

#   private

#   def parse_full_name(full_name)
#     name_parts = full_name.split

#     @first_name = name_parts.first
#     @last_name = name_parts.size > 1 ? name_parts.last : ''
#   end
# end

# bob = Person.new('Robert Smith')
# puts "The person's name is: #{bob}"
# # => "The person's name is: <Person:2342233x2623>"
# puts "The person's name is: #{bob.name}"
# => "The person's name is: Robert Smith"

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def to_s
    self.name
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  private

  def parse_full_name(full_name)
    name_parts = full_name.split

    @first_name = name_parts.first
    @last_name = name_parts.size > 1 ? name_parts.last : ''
  end
end

bob = Person.new('Robert Smith')
puts "The person's name is: #{bob}"
# => "The person's name is: Robert Smith"
