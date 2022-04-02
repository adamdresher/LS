# # frozen_string_literal: true

# NUM_SPELLING = [
#   ['zero', 0], ['one', 1], ['two', 2], ['three', 3],
#   ['four', 4], ['five', 5], ['six', 6], ['seven', 7],
#   ['eight', 8], ['nine', 9], ['ten', 10], ['eleven', 11],
#   ['twelve', 12], ['thirteen', 13], ['fourteen', 14],
#   ['fifteen', 15], ['sixteen', 16], ['seventeen', 17],
#   ['eighteen', 18], ['nineteen', 19]
# ].freeze

# def alphabetic_number_sort(arr)
#   sorted_num =
#     NUM_SPELLING.select { |ele| ele if arr.include?(ele[1]) }

#   sorted_num.sort.map { |ele| ele[1] }
# end

# Solution 2.
# frozen_string_literal: true

NUM_SPELLING = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
  5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
  10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen',
  14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen',
  18 => 'eighteen', 19 => 'nineteen'
}.freeze

def alphabetic_number_sort(hash)
  hash.map { |ele| NUM_SPELLING[ele] if NUM_SPELLING.key?(ele) }
      .sort
      .map { |num| NUM_SPELLING.key(num) }
end