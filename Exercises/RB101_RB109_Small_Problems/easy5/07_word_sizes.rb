# frozen_string_literal: true

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

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
