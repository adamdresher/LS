def rotate_rightmost_digits(num, n)
  num_arr = num.digits
  last_num = num_arr.delete_at(n-1)

  num_arr.unshift(last_num).reverse.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
