# print("Please write word or multiple words: ")
# phrase = gets.chomp

# letters = []
# phrase.chars.each do |letter|
#   letters << letter unless letter == ' '
# end

# puts("There are #{letters.length} characters in \"#{phrase}\".")

# Solution 2.
# print("Please write word or multiple words: ")
# phrase = gets.chomp

# letters = phrase.chars.delete_if { |letter| letter == ' ' }.length

# puts("There are #{letters} characters in \"#{phrase}\".")

# Solution 3.
print("Please write word or multiple words: ")
phrase = gets.chomp

letters = phrase.delete(' ').length

puts("There are #{letters} characters in \"#{phrase}\".")

# # Example input:
# Please write word or multiple words: walk

# # Output:
# There are 4 characters in "walk".

# # Example input:
# Please write word or multiple words: walk, don't run

# # Output:
# There are 13 characters in "walk, don't run".
