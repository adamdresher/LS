require 'set'

# def any?(arr, &block) # Hash and Set objects cannot be iterated through index
#   counter = 0

#   until counter.equal? arr.size
#     return true if yield(arr[counter])
#     counter += 1
#   end

#   false
# end

def any?(arr, &block)
  arr.each { |ele| return true if yield(ele) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# Further Exploration
p any?({ a: 4, 'b': 'hello', '3': ['hi'] }) { |value| value }
p any?(Set[1, 'hi', :wow, ['dude']]) { |value| value }