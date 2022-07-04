# def double_consonants(string)
#   string.chars.map do |char|
#     char.match?(/[^aeiou\d\W]/i) ? char * 2 : char
#   end.join
# end

# Solution 2.
def double_consonants(string)
  string.chars.inject('') do |sum, char|
    sum += char =~ (/[^aeiou\d\W]/i) ? char * 2 : char
  end
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
