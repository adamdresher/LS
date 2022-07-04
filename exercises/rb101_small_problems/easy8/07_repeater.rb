# def repeater(string)
#   string.chars.each_with_object('') { |char, new_str| new_str << char * 2 }
# end

# Solution 2.
def repeater(string)
  string.chars.inject('') {|sum, char| sum + char * 2 }
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
