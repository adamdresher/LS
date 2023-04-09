# def fibonacci(nth)
#   counter = 0
#   sequence = []

#   until counter == nth
#     sequence << (sequence.size < 2 ? 1 : sequence[-1] + sequence[-2])
#     counter += 1
#   end

#   sequence.last
# end

# Solution 2.
def fibonacci(nth)
  sequence = []

  nth.times do
    sequence << (sequence.size < 2 ? 1 : sequence[-1] + sequence[-2])
  end

  sequence.last
end

p fibonacci(20) # 6765
p fibonacci(100) # 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
