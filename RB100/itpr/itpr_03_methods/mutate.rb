a = [1, 2, 3]

# Example of a method definition that mutates the caller.
=begin
def mutate(array)
  array.pop
end
=end

# Example of a method definition that doesn't mutate the caller.
def mutate(array)
  array.last
end

puts "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"