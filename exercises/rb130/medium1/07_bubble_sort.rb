# Personal approach without a block from RB101
# def bubble_sort!(arr)
#   arr_end = (arr.length - 1)

#   loop do
#     new_end = 0

#     1.upto(arr_end) do |i| # 1 to begin comparison with 1st two elements
#       if arr[i - 1] > arr[i]
#         arr[i - 1], arr[i] = arr[i], arr[i - 1]
#         new_end = i
#       end
#     end

#     arr_end = new_end
#     break if arr_end <= 1
#   end

#   arr
# end

# Modified personal approach taking an optional block
def bubble_sort!(arr)
  arr_end = (arr.length - 1)

  loop do
    new_end = 0
    1.upto(arr_end) do |i| # 1 to begin comparison with 1st two elements
      first, second = arr[i - 1], arr[i]

      if block_given?
        unless yield(first, second)
          (arr[i - 1], arr[i] = arr[i], arr[i - 1])
          new_end = i
        end
      elsif first > second
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        new_end = i
      end
    end

    arr_end = new_end
    break if arr_end <= 1
  end

  arr
end

# LS approach without a block from RB101
# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end

# LS approach with an optional block
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

# Further Exploration, modified to pass to the block a single argument
# Schwartzian transformation?
#   map into 2 element array elements, [og_val, new_val]
#   sort array elements based on new_val
#   map to extract og_val in the sorted order
def bubble_sort_by!(arr)
  arr.map! { |ele| block_given? ? [ele, yield(ele)] : [ele, ele] }
  bubble_sort!(arr) { |a, b| a[1] <= b[1] }
  arr.map! { |ele| ele[0] }
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]
bubble_sort_by!(array)
p array

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]
bubble_sort_by!(array)
p array

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]
bubble_sort_by!(array) { |num| num.to_s }
p array

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)
bubble_sort_by!(array)
p array

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
bubble_sort_by!(array) { |name| name.size }
p array
