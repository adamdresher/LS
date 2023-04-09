# def move(n, from_array, to_array)
  # to_array << from_array.shift
  # move(n - 1, from_array, to_array) # this is a recursive method call
# end

def move(n, from_array, to_array)
  n.times { to_array << from_array.shift }
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
