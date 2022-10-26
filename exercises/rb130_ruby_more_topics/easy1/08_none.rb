# def none?(list, &block)
#   !!list.each { |ele| return false if yield(ele) }
# end

# def none?(list, &block)
#   list.reject { |ele| yield(ele) } == list
# end

require_relative '06_any'

def none?(list, &block)
  !any?(list, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
