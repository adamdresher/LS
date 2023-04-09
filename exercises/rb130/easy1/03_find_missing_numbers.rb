# def missing(arr)
#   missing_nums = []

#   arr.first.upto(arr.last) do |num|
#     missing_nums << num unless arr.include?(num)
#   end

#   missing_nums
# end

# Further Exploration
# Other approaches to the problem
# def missing(arr)
#   missing_nums = []

#   arr.each_cons(2) { |n1, n2| missing_nums << (n1 + 1...n2).to_a }
#   missing_nums.flatten
# end

# def missing(arr)
#   all_nums = (arr.first..arr.last)

#   all_nums.reject { |num| arr.include? num }
# end

# def missing(arr)
#   all_nums = (arr.first..arr.last)

#   included_nums, missing_nums = all_nums.partition { |num| arr.include? num }
#   missing_nums
# end

# def missing(arr)
#   (arr.first..arr.last).to_a.delete_if { |num| arr.include? num }
# end

# def missing(arr)
#   (arr.first..arr.last).to_a.keep_if { |num| arr.none? num }
# end

# Without using a block
def missing(arr)
  all_nums = (arr.first..arr.last).to_a

  all_nums - arr
end

# def missing(arr)
#   (arr.first..arr.last).to_a.difference arr
# end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
