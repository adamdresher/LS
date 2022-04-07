# frozen_string_literal: true

# A_Z = ('a'..'z')

# def cleanup(string)
#   new_string = ''
#   whitespace = true

#   string.chars.each do |char|
#     if A_Z.include?(char)
#       new_string << char
#       whitespace = true
#     elsif !A_Z.include?(char) && whitespace == true
#       new_string << ' '
#       whitespace = false
#     else
#       whitespace = false
#     end
#   end
  
#   new_string
# end

# Solution 2.
def cleanup(string)
  new_string = []

  string.chars.each do |char|
    'a'..'z'.include?(char) ? new_string << char : new_string << ' '
  end
  
  new_string.join.gsub(/ +/, ' ')
end

# Soltuion 3.
# def cleanup(string)
#   string.gsub(non-alphabetic char, ' ')
# end

p cleanup("---what's my +*& line?") == ' what s my line '
