ALPHANUM = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a

def count_alphanumeric(word)
  word.chars.select { |char| ALPHANUM.include?(char) }.size
end

def word_sizes(string)
  result = Hash.new(0)

  string.split.each do |word|
    length = count_alphanumeric(word)
    result[length] += 1
  end

  result
end
