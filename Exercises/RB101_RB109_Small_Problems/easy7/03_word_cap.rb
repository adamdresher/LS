# frozen_string_literal: true

ALPHABET = /[A-z]/.freeze

def word_cap(string) # escaped quotations escaped do not match
  string.split.map do |word|
    capitalize_word(word)
    # word[word.chars.find_index(('A'..'z'))].capitalize
  end.join(' ')
end

def capitalize_word(word)
  new_word = String.new
  # p word
  word.chars.each do |letter|
    # p letter
    if !letter.match?(ALPHABET)
      new_word << letter
    elsif letter.match?(ALPHABET) && !new_word.match?(ALPHABET)
      new_word << letter.upcase
    else
      new_word << letter.downcase
    end
  end
  new_word
end
# require 'pry'

# # Solution 2.
def word_cap(string) # escaped quotations escaped do not match
  capitalized_words = String.new
  string.chars.each_with_index do |char, i|
    # binding.pry
    capitalized_words <<
      if !(char.match?(ALPHABET)
        char
      elsif i == 0 || !(string[i-1].match? ALPHABET)
        char.upcase
      else
        char.downcase
      end

  end
  capitalized_words
end

p word_cap('four score and seven') # == 'Four Score And Seven'
p word_cap('the javaScript language') # == 'The Javascript Language'
p word_cap('this is a "quoted" word') # == 'This Is A "quoted" Word'
