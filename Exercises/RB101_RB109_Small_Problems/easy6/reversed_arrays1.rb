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
