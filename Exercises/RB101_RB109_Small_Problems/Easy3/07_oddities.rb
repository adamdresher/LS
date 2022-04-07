# def oddities(arr)

#   new_arr = []
#   arr.each_with_index do |element, index|
#     new_arr.push(element) if index.even?
#   end
#   new_arr

# end

# Solution.  Further Exploration.
# def oddities(arr)

#   new_arr = []
#   arr.each_with_index do |element, index|
#     new_arr.push(element) if index.odd?
#   end
#   new_arr

# end

# Solution 2.  Further Exploration.
# def oddities(arr)

#   new_arr = []
#   arr[1..-1].each_with_index do |element, index|
#     new_arr.push(element) if index.even?
#   end
#   new_arr

# end

# Solution 3.  Further Exploration.
# def oddities(arr)

#   new_arr = []
#   arr[1..-1].each_with_index do |element, index|
#     new_arr.push(element) if index % 2 == 0
#   end
#   new_arr

# end

# Solution 4.  Further Exploration.
def oddities(arr)

  arr.select.with_index { |element, index| element if index.odd? }

end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
