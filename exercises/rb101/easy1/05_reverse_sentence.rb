# def reverse_sentence(string)
#   if string.split == [] then return '' end
#   string.split(' ').reverse.join(' ')
# end

# Solution 2.
def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == ''
