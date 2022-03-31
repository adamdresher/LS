# frozen_string_literal: true

# def halvsies(arr)
#   p first_half_end = ((arr.size - 1.0) / 2).round(half: :down)
#   p second_half_start = ((arr.size).to_f / 2).round

#   [arr[0..first_half_end], arr[second_half_start..-1]]
# end

# Solution 2.
# frozen_string_literal: true

def halvsies(arr)
  middle = ((arr.size) / 2.0).round
  first_half = arr.dup
  second_half = first_half.slice!(middle..-1)

  [first_half, second_half]
end
