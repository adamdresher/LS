# def average(arr)
#   arr.each do |i|
#     return (puts "<Argument must be an array of only positive integers>") if (i != i.to_i || i.negative?)
#   end

#   sum = 0
#   arr.map { |i| sum += i }
#   sum / arr.length
# end

# Solution.  Further Exploration.
def average(arr)
  arr.each do |i|
    return (puts "<Argument must be an array of only positive numbers>") if i.negative?
  end

  sum = arr.inject(:+).to_f
  sum / arr.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
