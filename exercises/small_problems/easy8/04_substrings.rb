def substrings(string)
  string.chars.map.with_index do |_, outer_i|
    set = string.chars[outer_i..]

    set.map.with_index { |_, inner_i| set[..inner_i].join }
  end.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
