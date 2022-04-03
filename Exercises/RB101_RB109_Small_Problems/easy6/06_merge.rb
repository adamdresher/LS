# frozen_string_literal: true

def merge(arr1, arr2)
  new_arr = []

  arr1.each { |ele| new_arr << ele unless new_arr.include?(ele) }
  arr2.each { |ele| new_arr << ele unless new_arr.include?(ele) }

  new_arr
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
