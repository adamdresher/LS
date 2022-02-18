def real_palindrome?(string)
  string = string.downcase.chars.select do |chr|
    ('0'...'9').include?(chr) || ('a'...'z').include?(chr)
  end.join
  string == string.reverse
end