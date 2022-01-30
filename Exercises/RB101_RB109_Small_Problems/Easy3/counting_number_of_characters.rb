=begin
Understanding the **Problem**:
- Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

Questions/Answers:
- What is the input?
    - User input, string.
- What is the output?
    - String with calculation of input's character length.
- Are white spaces counted?
    - No.
- Are special characters accepted and counted?
    - Assume yes.
        
Mental Model:
- Create a program that asks user for a word/s.  Calculate the number of characters, ignoring whitespaces, then output the result.

**Examples/Tests**:
Input: `Please write word or multiple words: walk`
Output: `There are 4 characters in "walk".`
Input: `Please write word or multiple words: walk, don't run`
Output: `There are 13 characters in "walk, don't run".`

**Data Structures**:
Array.

**Algorithm**:
- START

- PRINT request for string input
- GET user input
- SET input to an array of substrings
- delete substrings == ' '
- count length of array

- PRINT results as a string

- END

**Code**:
=end
# SOLUTION 1.
# print("Please write word or multiple words: ")
# phrase = gets.chomp

# letters = []
# phrase.chars.each do |letter|
#   letters << letter unless letter == ' '
# end

# puts("There are #{letters.length} characters in \"#{phrase}\".")


# SOLUTION 2.  REFACTORED.
# print("Please write word or multiple words: ")
# phrase = gets.chomp

# letters = phrase.chars.delete_if { |letter| letter == ' ' }.length

# puts("There are #{letters} characters in \"#{phrase}\".")

# SOLUTION 3.  REFACTORED using only strings.
print("Please write word or multiple words: ")
phrase = gets.chomp

letters = phrase.delete(' ').length

puts("There are #{letters} characters in \"#{phrase}\".")
