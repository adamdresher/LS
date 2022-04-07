VOWELS = %(aeiou)

def remove_vowels(array_of_strings)
  result = []
  counter = 0

  while counter < array_of_strings.size
    word = ''
    word_counter = 0

    while word_counter < array_of_strings[counter].size
      unless VOWELS.include?(array_of_strings[counter][word_counter].downcase)
        word << array_of_strings[counter][word_counter]
      end

      word_counter += 1
    end
    
    result << word
    counter += 1
  end

  result
end

# Solution 2.
VOWELS = %(aeiouAEIOU)

def remove_vowels(array_of_strings)
  array_of_strings.map { |word| word.gsub(/[#{VOWELS}]/, '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
