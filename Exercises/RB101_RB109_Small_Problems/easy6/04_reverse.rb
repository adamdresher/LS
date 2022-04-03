# frozen_string_literal: true

# def reverse!(list)
#   reversed_list = []

#   (reversed_list << list.pop)   until list.empty?
#   (list << reversed_list.shift) until reversed_list.empty?

#   list
# end

# Solution 2.
# frozen_string_literal: true

def reverse!(list)
  list.map!.with_index { |ele, i| [ele, list.size - i] }
      .sort! { |a, b| a[1] <=> b[1] }
      .map! { |ele| ele[0] }
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true
