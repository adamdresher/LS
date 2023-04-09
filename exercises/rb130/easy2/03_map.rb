def map(arr)
  if block_given?
    arr.each_with_object([]) { |ele, new_arr| new_arr << yield(ele) }
  end
end

def map(arr)
  if block_given?
    arr.inject([]) { |new_arr, ele| new_arr << yield(ele) }
  else
    arr.to_enum
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map([1, 3, 4])

hash1 = {a: 1, b: 3, c: 4}
p map(hash1) { |key, val| val**2 } == [1, 9, 16]

require 'Set'

set1 = [1, 3, 4].to_set
p map(set1) { |val| val**2 } == [1, 9, 16]