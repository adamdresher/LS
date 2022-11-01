# Problem:
# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

# Input: An Array of Integers
# Return: Same Array mutated (sorted with Bubble Sort)
# Goal: Sort the argument Array using Bubble Sort
# Rules:
#  mutate argument
#  Bubble Sort:
#    iterate through collection:
#      compare current element with next element in collection
#      swap element order if first element is larger than second element
#    collection is considered sorted when no more swapping occurs in an iteration

# Example:
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Data Structure:
# [6, 2, 7, 1, 4] =>
# [2, 6, 7, 1, 4] =>
# [2, 6, 1, 7, 4] =>
# [2, 6, 1, 4, 7] => check if any swaps occurred => true
# [2, 6, 1, 4, 7] =>
# [2, 1, 6, 4, 7] =>
# [2, 1, 4, 6, 7] =>
# [2, 1, 4, 6, 7] => check if any swaps occurred => true
# [1, 2, 4, 6, 7] => check if any swaps occurred => true
# [1, 2, 4, 6, 7] => check if any swaps occurred => false
# [1, 2, 4, 6, 7]

# Algorithm:
#  initialize iteration_swapped = []
#  while iteration_swapped.any?
#    iteration_swapped = []
#    iterate over array:
#      compare current element with next element
#      if current element is larger, swap elements' order
#        if <=> comparison == 1
#        iteration_swapped << true
#  array

# [6, 2, 7, 1, 4] =>
# [2, 6, 7, 1, 4] =>
# [2, 6, 1, 7, 4] =>
# [2, 6, 1, 4, 7] => check if any swaps occurred => true
# [2, 6, 1, 4] =>
# [2, 1, 6, 4] =>
# [2, 1, 4, 6] =>
# [2, 1, 4] => check if any swaps occurred => true
# [1, 2, 4] => check if any swaps occurred => true
# [1, 2] => check if any swaps occurred => false
# [1, 2, 4, 6]

# Algorithm: optimized to reduce inner iterations by 1 on each outer iteration
#  initialize end to the length of the argument - 1
#  initialize swapped = []
#  loop:
#    swapped = []
#    iterate from 0 to end:
#      compare current element with next element
#      if current element is larger, swap elements' order
#        if <=> comparison == 1
#        swapped << true
#    reduce end by 1
#    break if swapped contains any elements
#  array

# Algorithm: optimized to stop each inner iteration based on last swap element
#  initialize end to the length of the argument - 1
#  loop:
#    initialize new_end = 0
#    iterate from 1 to end: (1 to begin comparison with 1st 2 elements)
#      compare current element with previous element
#      if previous element is larger, swap elements' order
#        new_end = i
#    end = new_end
#    break if end is less than or equal to 1
#  array

# Code:
def bubble_sort!(arr)
  the_end = (arr.length - 1)

  loop do
    swapped = []

    0.upto(the_end) do |i|
      if (arr[i] <=> arr[i + 1]) == 1 # nil when accessing out of bounds element
        swapped << true
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
      end
    end

    the_end -= 1
    break unless swapped.any?
  end

  arr
end

# Optimized Solution
def bubble_sort!(arr)
  the_end = (arr.length - 1)

  loop do
    new_end = 0

    1.upto(the_end) do |i| # 1 to begin comparison with 1st two elements
      [arr[i - 1], arr[i]]

      if arr[i - 1] > arr[i]
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        new_end = i
      end
    end

    the_end = new_end
    break if the_end <= 1
  end

  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
