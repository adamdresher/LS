# frozen_string_literal: true

# This solution ignores non-alphabetical characters when seeking characters to capitalize.
# ALPHABET = /[A-z]/.freeze

# def word_cap(string)
#   string.split.map { |word| capitalize_word(word) }.join(' ')
# end

# def capitalize_word(word)
#   new_word = String.new

#   word.chars.each do |letter|
#     if letter.match?(ALPHABET) && !new_word.match?(ALPHABET)
#       new_word << letter.upcase
#     else
#       new_word << letter.downcase
#     end
#   end

#   new_word
# end

# # # Solution 2.
# def word_cap(string)
#   capitalized_words = String.new

#   string.chars.each_with_index do |char, i|
#     capitalized_words <<
#       if !(char.match?(ALPHABET)
#         char
#       elsif i == 0 || !(string[i-1].match? ALPHABET)
#         char.upcase
#       else
#         char.downcase
#       end
#   end

#   capitalized_words
# end

# This solution does not capitalize the first alphabetical character if it is preceded by a non-alphabetical character (which is not a whitespace).
# Solution 3.
# ALPHABET = /[A-z]/.freeze

# def word_cap(string)
#   string.split.map do |word|
#     word.chars.map! do |letter|
#       if letter.match?(ALPHABET) && letter == word[0]
#         letter.upcase
#       else
#         letter.downcase
#       end
#     end.join
#   end.join(' ')
# end

# Solution 4.
def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
