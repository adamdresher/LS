# frozen_string_literal: true

# def word_sizes(string)
#   result = {}

#   string.split.each do |word|
#     if result.include?(word.size)
#       result[word.size] = result[word.size] + 1
#     else
#       result[word.size] = 1
#     end
#   end

#   result
# end

# Solution 2.
# def word_sizes(string)
  # result = {}
# 
  # string.split.each do |word|
    # result[word.size] = case result[word.size]
                        # when nil then 1
                        # else          result[word.size] + 1
                        # end
  # end
# 
  # result
# end

# Solution 3.
# def word_sizes(string)
#   result = {}

#   string.split.each do |word|
#     result[word.size] =
#       result.key?(word.size) ? result[word.size] + 1 : 1
#   end

#   result
# end

# Solution 4.
def word_sizes(string)
  result = {}
  words = string.split.map(&:size)

  words.map do |num|
    result[num] = words.count(num) unless result.include?(num)
  end

  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
