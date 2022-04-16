# frozen_string_literal: true

# def rotate_array(arr)
#   return Array.new if arr.empty?

#   first, second = arr.partition { |ele| ele.object_id == arr[0].object_id }
#   second + first
# end

# Solution 2.
# def rotate_array(arr)
#   return Array.new if arr.empty?

#   arr.drop(1) << arr.first
# end

# Solution 3.
# def rotate_array(arr)
#   return Array.new if arr.empty?

#   new_arr = arr.dup
#   first_ele = new_arr.shift
#   new_arr << first_ele
# end

# Solution.  Further Exploration.
# def rotate_object(object)
#   object_type = object.class.to_s
#   object_array = case object_type
#                  when 'Integer' then object.digits.reverse
#                  when 'String' then object.chars
#                  when 'Hash' then object.to_a
#                  when 'Array' then object
#                  end

#   rotated_object = rotate_array(object_array)

#   case object_type
#   when 'Integer' then rotated_object.join.to_i
#   when 'String' then rotated_object.join
#   when 'Hash' then rotated_object.to_h
#   else rotated_object
#   end
# end

# Solution 2. Further Exploration.
def rotate_array(arr)
  return [] if arr.empty?
  arr.drop(1) << arr.first
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integers(num)
  rotate_array(num.digits.reverse).join.to_i
end

def rotate_hash(hash)
  rotate_array(hash.to_a).to_h
end

def rotate_object(object)
  object_array = case object.class.to_s
                 when 'Integer' then rotate_integers(object)
                 when 'String' then rotate_string(object)
                 when 'Hash' then rotate_hash(object)
                 when 'Array' then rotate_array(object)
                 end
end

p rotate_object([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_object(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_object(['a']) == ['a']
# Further Exploration
p rotate_object([]) == []
p rotate_object('abcde') == "bcdea"
p rotate_object('') == ''
p rotate_object(12345) == 23451
p rotate_object({ a: [1, 2, 3], b: ['aardvark', 'bison', 'catapillar'], c: 'hello' }) == { b: ['aardvark', 'bison', 'catapillar'], c: 'hello', a: [1, 2, 3] }
p rotate_object({}) == {}

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
