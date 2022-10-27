# Does not stop once one is found
# def one?(list, &block)
#   truthy_ele = []
#   list.each { |ele| truthy_ele << ele if yield(ele) }
#   truthy_ele.size == 1
# end

# Does not stop once one is found
# def one?(list, &block)
#   total = list.each_with_object([]) { |ele, arr| arr << ele if yield(ele) }
#   total.size == 1
# end

# def one?(list, &block)
#   one_found, two_found = false, false

#   list.each do |ele|
#     two_found = true if yield(ele) && one_found
#     one_found = true if yield(ele)
#     return false if two_found
#   end
#   one_found
# end

def one?(list) # implicit block is required by yield
  one_found = false

  list.each do |ele|
    return false if yield(ele) && one_found
    one_found = true if yield(ele)
  end

  one_found
end

# def one?(list) # LS solution ; it reads well
#   one_found = false

#   list.each do |ele|
#     next unless yield(ele)
#     return false if one_found
#     one_found = true
#   end

#   one_found
# end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false
