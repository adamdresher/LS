def diamond(n)
  half_diamond = (1..n).each_with_object([]) { |i, a| a << i if i.odd? }
  diamonds = (half_diamond + half_diamond.reverse[1..])
  middle = n / 2
  counter = 0

  until counter == n
    if counter <= middle
      puts ' ' * (middle - counter) + '*' * diamonds[counter]
    else
      puts ' ' * (counter - middle) + '*' * diamonds[counter]
    end
    counter += 1
  end
end

diamond(1)
# *

diamond(3)
#  *
# ***
#  *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
