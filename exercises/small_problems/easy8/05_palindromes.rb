def substrings(string)
  string.chars.map.with_index do |_, outer_i|
    set = string.chars[outer_i..]

    set.map.with_index { |_, inner_i| set[..inner_i].join }
  end.flatten
end

def palindromes(string, alphanumeric_and_case_sensitive=false)
  substrings(string).select do |word|
    if alphanumeric_and_case_sensitive
      word = word.chars.select { |char| char.match? /\w/ }.join.downcase
    end

    word.size > 1 && word == word.reverse
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
# # Further Exploration
p palindromes('hello-madam-did-madam-goodbye', true) == [
"ll", "-madam", "-madam-", "-madam-did-madam", "-madam-did-madam-", "madam", 
"madam-", "madam-did-madam", "madam-did-madam-", "ada", "adam-did-mada", 
"dam-did-mad", "am-did-ma", "m-did-m", "-did", "-did-", "did", "did-", 
"-madam", "-madam-", "madam", "madam-", "ada", "oo"
]
p palindromes("ab434ba?@RakaraK", true) == [
 'ab434ba', 'ab434ba?', 'ab434ba?@', 'b434b', '434', 'a?@Ra', 'a?@Rakara', 
 '?@Rakar', '@Rakar', 'Rakar', 'aka', 'karaK', 'ara'
]
