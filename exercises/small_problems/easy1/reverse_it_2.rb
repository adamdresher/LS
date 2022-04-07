=begin
Understanding the **Problem**:
- Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Questions/Answers:
- What is the input?
    - A string.
- What is the output?
    - A string.
- Does it matter how long each word is?
    - The test cases do not check for this, but the problem states the argument string must contain words 5 or more characters long.
- What is reversed: the word order, word's character order, or both?
    - Both.
- Do non-alphanumeric characters need to be considered?
    - No.  Only letters and spaces will be given in the string.

Mental Model:
- Create a method that takes one string parameter.  If the argument contains words that are 5 or more characters long, then reverse the string by individual character- not by word.

**Examples/Tests**:
```ruby
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
# Extra test case
puts reverse_words('4 is not long e nuff.')  # => 4 is not long e nuff.
                                             # <Argument must contain substrings that contain five or more characters>
```
**Data Structures**:
- Array.

**Algorithm**:
- Algorithm 1:
  - Create a method called, `reverse_words` with a parameter called, `string`.
  - Split `string` by substrings.
  - Select the substring with the miniumum length.
  - If the shortest substring is less than 5 characters, return an error.
  - Else, reverse `string`, and return it.

- Algorithm 2:
  - Create a method called, `reverse_words` with a parameter called, `string`.
  - Split `string` by substrings.
  - Iterate through the new array and select if the substring's length is 5 or larger.
  - If true, reverse `string`, and return it.
  - Else, return an error.

**Code**:
=end
# SOLUTION 1.
def reverse_words(string)
  if string.split.any? { |word| word.length >= 5 }
    string.reverse
  else
    return (puts "<Argument must contain substrings that are five or more characters long>")
  end
end


# SOLUTION 2.  MEMORY AND COMPETENCY TEST.
def reverse_words(string)
  if string.split.any? { |word| word.length >= 5 }
    string.split.reverse.map { |word| word.reverse }.join(' ')
  else
    return (puts "<Argument must contain substrings that are five or more characters long>")
  end
end
