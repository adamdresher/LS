def word_sizes(string)
  result = {}

  string.split.each do |word|
    if result.include?(word.size)
      result[word.size] = result[word.size] + 1
    else
      result[word.size] = 1
    end
  end

  result
end

# Solution.  Refactored.
def word_sizes(string)
  result = {}

  string.split.each do |word|
    result[word.size] = case result[word.size]
                        when nil then 1
                        else          result[word.size] + 1
                        end
  end

  result
end

# Solution.  Refactored 2.
def word_sizes(string)
  result = {}

  string.split.each do |word|
    result[word.size] =
      result.key?(word.size) ? result[word.size] + 1 : 1
  end

  result
end

# Solution.  Refactored 3.
def word_sizes(string)
  result = {}
  words = string.split.map(&:size)

  words.map do |num|
    result[num] = words.count(num) unless result.include?(num)
  end

  result
end
