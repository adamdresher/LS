# frozen_string_literal: true

# def crunch(string)
#   new_string = ''

#   string.chars.each do |letter|
#     new_string << letter unless new_string.end_with?(letter)
#   end
  
#   new_string
# end

# Solution 2.
def crunch(string)
  new_string = ''

  string.each_char do |letter|
    new_string << letter unless new_string.end_with?(letter)
  end
  
  new_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
