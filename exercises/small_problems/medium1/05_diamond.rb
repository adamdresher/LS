# def diamond(n)
#   half_diamond = (1..n).each_with_object([]) { |i, a| a << i if i.odd? }
#   diamonds = (half_diamond + half_diamond.reverse[1..])
#   middle = n / 2
#   counter = 0

#   until counter == n
#     if counter <= middle
#       puts ' ' * (middle - counter) + '*' * diamonds[counter]
#     else
#       puts ' ' * (counter - middle) + '*' * diamonds[counter]
#     end
#     counter += 1
#   end
# end

# Solution.  Further Exploration.
def unfilled_diamond(rows)
  rows.map do |row|
    updated_row = []

    row.each_char.with_index do |char, i|
      updated_row << 
        (i == row.size - 1 || i == row.index('*') ? char : ' ')
    end

    updated_row.join
  end
end

def diamond(size, filled = false)
  half_diamond = (1..size).each_with_object([]) { |i, a| a << i if i.odd? }
  full_diamond = (half_diamond + half_diamond.reverse[1..])

  filled_diamond = []
  middle = size / 2
  counter = 0

  until counter == size
    if counter <= middle
      filled_diamond << ' ' * (middle - counter) + '*' * full_diamond[counter]
    else
      filled_diamond << ' ' * (counter - middle) + '*' * full_diamond[counter]
    end
    counter += 1
  end

  puts filled ? filled_diamond : unfilled_diamond(filled_diamond)
end

diamond(1)
# *

diamond(3)
#  *
# ***
#  *

diamond(9, true)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

diamond(9, false)
#     *
#    * *
#   *   *
#  *     *
# *       *
#  *     *
#   *   *
#    * *
#     *
