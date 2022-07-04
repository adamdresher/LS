def rotate_rightmost_digits(num, n)
  num_arr = num.digits
  last_num = num_arr.delete_at(n-1)

  num_arr.unshift(last_num).reverse.join.to_i
end

def max_rotation(num)
  counter = num.digits.length
  while counter > 0
    num = rotate_rightmost_digits(num, counter)
    counter -= 1
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8703529146) == 7321609845
