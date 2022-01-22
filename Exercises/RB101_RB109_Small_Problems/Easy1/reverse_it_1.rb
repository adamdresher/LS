=begin
Understanding the **Problem**:
- Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Questions/Answers:
- What is the input?
    - A string.
- What is the output?
    - A string.
- Does the method care about whitespaces at the beginning or end of the string?
    - The test cases do no specify.  Assume there are no whitespaces beginning or ending the string.
- Does the method accept empty strings?
    - Yes, it returns an empty string.
- Does the method care about dividing whitespaces with a length greater than 1?
    - The test cases do not specify.  Assume dividing whitespaces are always a length of 1.

Mental Model:
- Create a method that takes a string argument.  If the string only contains whitespaces, it returns an empty string.  Otherwise the string is split by whitespaces to create a list.  The list is put in reverse order and rejoined with whitespaces to create a new string.

**Examples/Tests**:
```ruby
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
```
**Data Structures**:
- Array.

**Algorithm**:
- Algorithm 1:
  - Create a method called, `reverse_sentence` with a parameter called, `string`.
  - Check if `string` contains only whitespaces and returns an empty string if true.
  - If not true, split `string` by using a whitespace as a delimiter and create an array of words.
  - Reverse the order of the array.
  - Join the array together, adding a whitespace as a delimiter.
  - Return the string.

**Code**:
=end
# SOLUTION 1.
def reverse_sentence(string)
  if string.split == [] then return '' end
  string.split(' ').reverse.join(' ')
end


# SOLUTION 2.  REFACTORED.
def reverse_sentence(string)
  string.split.reverse.join(' ')
end
