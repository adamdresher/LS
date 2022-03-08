# SOLUTION.
def running_total(nums)
  updated_nums = []
  current_num = 0

  nums.each do |i|
    current_num += i
    updated_nums << current_num
  end

  updated_nums
end


# SOLUTION.  REFACTORED 2.
def running_total(nums)
  current_num = 0

  nums.map do |i|
    current_num += i
  end

end


# Solution.  FURTHER EXPLORATION 1.
def running_total(nums)
  nums.each_with_object([]) do |element, a|
    a.any? ? a.push(element + a.last) : a << element
  end
end


# Solution.  FURTHER EXPLORATION 2.
def running_total(nums)
  current_num = 0

  updated_nums = nums.inject([]) do |arr, num|
    arr << current_num += num
  end

  updated_nums
end
