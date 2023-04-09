# def reverse_words(string)
#   if string.split.any? { |word| word.length >= 5 }
#     string.reverse
#   else
#     return (puts "<Argument must contain substrings that are five or more characters long>")
#   end
# end

# Solution 2.
def reverse_words(string)
  if string.split.any? { |word| word.length >= 5 }
    string.split.reverse.map { |word| word.reverse }.join(' ')
  else
    return (puts "<Argument must contain substrings that are five or more characters long>")
  end
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
# Extra test case
puts reverse_words('4 is not long e nuff.')  # => 4 is not long e nuff.
                                             # <Argument must contain substrings that contain five or more characters>