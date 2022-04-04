# frozen_string_literal: true

# def running_total(nums)
#   updated_nums = []
#   current_num = 0
#   count = 0

#   loop do
#     break if count == nums.size

#     current_num += nums[count]
#     updated_nums << current_num
#     count += 1
#   end

#   updated_nums
# end

# Solution 2.
# def running_total(nums)
#   updated_nums = []
#   current_num = 0

#   nums.each do |i|
#     current_num += i
#     updated_nums << current_num
#   end

#   updated_nums
# end

# Solution 3.
# def running_total(nums)
#   current_num = 0

#   nums.map do |i|
#     current_num += i
#   end

# end

# Solution.  FURTHER EXPLORATION 1.
# def running_total(nums)
#   nums.each_with_object([]) do |element, a|
#     a.any? ? a.push(element + a.last) : a << element
#   end
# end

# Solution.  FURTHER EXPLORATION 2.
def running_total(nums)
  current_num = 0

  updated_nums = nums.inject([]) do |arr, num|
    arr << current_num += num
  end

  updated_nums
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
