# SOLUTION.
def multisum(input)
  arr = (1..input).to_a.map { |i| i if (i % 3 == 0) || (i % 5 == 0) }
  arr.compact.inject(:+)
end


# SOLUTION.  REFACTORED.
def multisum(input)
  (1..input).inject(0) do |sum, i|
    (i % 3 == 0) || (i % 5 == 0) ? sum += i : sum += 0
  end
end


# SOLUTION 2.
def multisum(input)
  sum = 0
  input.times do |i|
    i += 1
    if (i % 3 == 0) || (i % 5 == 0)
      sum += i
    end
  end
  sum
end


# SOLUTION 2.  REFACTORED.
def multisum(input)
  sum = 0
  input.times do |i|
    sum += (i + 1) if ((i + 1) % 3 == 0) || ((i + 1) % 5 == 0)
  end
  sum
end


# Solution 2, Integer#times does not seem like a great fit for this exercise 
# but it was fun figuring out how to get it working.
def multisum(input)
  sum = 0
  input.times { |i| i += 1 ; sum += i if (i % 3 == 0) || (i % 5 == 0) }
  sum
end
