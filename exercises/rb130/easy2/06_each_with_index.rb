# def each_with_index(arr)
#   return arr.to_enum unless block_given?
#   idx = 0
#   arr.each do |ele|
#     yield([ele, idx])
#     idx += 1
#   end
# end

# def each_with_index(arr)
#   return arr.to_enum unless block_given?
#   0.upto(arr.size - 1) { |idx| yield([arr[idx], idx]) }
#   arr
# end

# def each_with_index(arr)
#   return arr.to_enum unless block_given?
#   arr.inject(0) { |idx, ele| yield(ele, idx) ; idx + 1 }
#   arr
# end

def each_with_index(arr)
  return arr.to_enum unless block_given?
  arr.each_with_object([]) { |ele, idx| yield([ele, idx.size]) ; idx << 1 }
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
p each_with_index([1, 3, 6])