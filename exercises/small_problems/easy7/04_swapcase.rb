# frozen_string_literal: true

def swapcase(string)
  new_string = ''

  string.each_char do |char|
    new_string << (char == char.upcase ? char.downcase : char.upcase)
  end

  new_string
end

# Solution 2.
# frozen_string_literal: true

# ALPHABET = [('a'..'z').to_a, ('A'..'Z').to_a].freeze

# def swapcase(string)
#   string.chars.map do |char|
#     if ALPHABET[0].include?(char)
#       ALPHABET[1][ALPHABET[0].find_index(char)]
#     elsif ALPHABET[1].include?(char)
#       ALPHABET[0][ALPHABET[1].find_index(char)]
#     else
#       char
#     end
#   end.join
# end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
