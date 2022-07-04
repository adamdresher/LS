### Understanding the Problem
Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

**Explicit Requirements:**

- Input: A string of numbers.
- Return: An integer.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that accepts a string argument and returns it as an integer.

---
### Examples/Tests
```ruby
string_to_integer('4321') == 4321
string_to_integer('570') == 570

# Further Exploration.
hexadecimal_to_integer('4D9f') == 19871
hexadecimal_to_integer('FFFFFF') == 16777215
hexadecimal_to_integer('ffffff') == 16777215
hexadecimal_to_integer('aAbBcC') == 11189196
hexadecimal_to_integer('') == 0
```
---
### Data Structures
None.

---
### Algorithm
**string_to_integer**
- create a method that accepts a string argument
- set the argument to a new collection of substrings
- set a variable for final return value, `number = 0`
- convert substrings to integers # how???
- loop through the collection
  - if the substring equals the integer equivelant, return integer
  - if substring's index is 0, add integer to number
  - else multiply integer by index * 10, add return to number

- Return the number

FURTHER EXPLORATION:
- initialize a hash with the conversions for a hexadecimal to a decimal ('hexadecimal' => decimal)
- initialize an empty array as a placeholder
- initialize a variable, `integer`, for the final return value and assign it to `0`
- iterate through the string input's characters
  - if the character matches ('a'..'f'), upcase it and pass on the character
  - if the character matches a hash key, push the key's value to the array
  - next iteration
- reverse the array's order
- iterate through the array
  - pass the element and index through a template to return `(element * 16**index)`
  - add `integer` += to return value
- return `integer`

---
### Code
*see `07_string_to_integer.rb`*
