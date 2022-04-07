=begin
Understanding the **Problem**:
- Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

- Modify `stringy` so it takes an additional optional argument that defaults to `1`. If the method is called with this argument set to `0`, the method should return a `String` of alternating 0s and 1s, but starting with `0` instead of `1`.

Questions/Answers:
- What is the input?
    - An integer.
- What is the output?
    - A string.
- Is the input ever a float or negative number?
    - The problem description specifies a positive integer, so anything else should not be accepted.
- What about 0?
    - The test cases don't include 0, however the problem description states the argument will be a positive number.  Generally speaking, 0 is not considered a positive or negative number and thus should not be considered a valid argument for this method.
- Does it matter if you start with 1 or 0?
    - Yes, always start with 1.

Questions/Answers for Further Exploration:
- What is the form of the second parameter?
    - It's a parameter with a default value.
- What is the default value for the second parameter?
    - `1`.
- What does the second parameter do?
   - It tells the method to start with `0` or `1`.

Mental Model:
- Create a method that returns a string of alternating characters, `'1'` and `'0'`, beginning with `'1'`.  The string's length of the string is based on the given parameter.

Mental Model for Further Exploration:
- Create a method that returns a string of alternating characters, `'1'` and `'0'`.  The string's length is based on the first parameter.  The second parameter dictates whether to start with `'1'` or `'0'` and is set to `'1'` as default.

**Examples/Tests**:
```ruby
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```
**Data Structures**:
- String

**Algorithm**:
- Algorithm 1:
  - Create a method called, `stringy` with a parameter called, `num`.
  - Create an empty string called, `string`.
  - Loop `num` times through a block.
  - The block checks if `string`s last substring is `1`.
  - If `true`, push `0` to `string`, else push `1` to `string`.
  - After iterating, return `string`.

- Algorithm 2, for Further Exploration:
  - Create a method called, `stringy` with a parameter called, `num`.
  - Create the variable, `string`, and assign it to the second parameter.
  - Loop `num` times through a block.
  - The block checks if `string`s last substring is `1`.
  - If `true`, push `0` to `string`, else push `1` to `string`.
  - After iterating, return `string`.

**Code**:
=end
# SOLUTION 1.
def stringy(num)
  string = ''
  
  num.times do
    if string.end_with? '1'
      string << '0'
    else
      string << '1'
    end
  end
  string
end


# SOLUTION 2.  REFACTORED.
def stringy(num)
  string = ''
  
  num.times do
    string.end_with? '1' ? string << '0' : string << '1'
  end
  string
end


# SOLUTION 2.  FURTHER EXPLORATION.
def stringy(num, start = '1')
  string = start
  
  (num - 1).times do
    (string.end_with? '1') ? string << '0' : string << '1'
  end
  string
end
