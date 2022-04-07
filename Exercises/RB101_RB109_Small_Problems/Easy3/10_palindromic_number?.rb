def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end

# Solution.  Further Exploration.  # block ignores preceding `0`
# def palindrome?(string)
#   string == string.reverse
# end

# def palindromic_number?(num)
#   counter = num
#   length = 0
#   while (counter > 0)
#     length += 1
#     counter = counter/10
#   end
  
#   palindrome?(format("%0#{length}d", num))
# end

# Solution 2.  Further Exploration.  # Integer#digits ignores preceding `0`
# def palindrome?(string)
#   string == string.reverse
# end

# def palindromic_number?(num)
#   num.digits.map { |num| num.to_s }.join
#   palindrome?(num.to_s)
# end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
