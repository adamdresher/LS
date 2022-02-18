def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end
