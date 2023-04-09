# # approach 1:
# module Walkable
#   # this requires modifying the module for every edge case and doesn't scale
#   # well
#   def walk
#     if self.class == Noble
#       puts "#{title} #{name} #{gait} forward"
#     else
#       puts "#{name} #{gait} forward"
#     end
#   end
# end

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Noble < Person
#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# # approach 2:
# module Walkable
#   def walk
#     puts "#{name} #{gait} forward"
#   end
# end

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Noble < Person
#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   # overriding the method of the unique class is a simple and straightforward
#   # approach.  Seems wise when there is only one or two unique cases.
#   def walk
#     puts "#{title} #{name} #{gait} forward"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# approach 3:
# module Walkable
#   # by calling the object itself, every class must be modified to ensure #to_s
#   # correctly outputs @name, or @title + @name- as it may be for Noble objects
#   def walk
#     puts "#{self} #{gait} forward"
#   end
# end

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Noble < Person
#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   def to_s
#     "#{title} #{name}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# approach 4:
module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private
  def full_name
    name
  end

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  private

  def full_name
    "#{title} #{name}"
  end

  def gait
    "struts"
  end
end

byron = Noble.new('Byron', 'Lord')
byron.walk # => 'Lord Byron struts forward'
byron.name # => 'Byron'
byron.title # => 'Lord'
