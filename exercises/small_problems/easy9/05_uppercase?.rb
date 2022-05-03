# def uppercase?(str)
#   letters = str.chars.select { |char| char.match? /[A-z]/ }
#   !letters.any? { |char| char.match? /[a-z]/ }
# end

# Solution 2.
# def uppercase?(str)
#   letters = str.chars.select { |char| char =~ /[A-z]/ }
#   letters.all? { |char| char =~ /[A-Z]/ }
# end

# Solution 3.
def uppercase?(str)
  !str.chars.any? { |char| char.match? /[[:lower:]]/ }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
