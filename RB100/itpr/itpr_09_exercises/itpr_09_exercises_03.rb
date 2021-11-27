arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_arr = arr.select { |n| n % 2 == 1 }

p new_arr
