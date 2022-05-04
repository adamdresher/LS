### Understanding the Problem
Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.
- Argument contains two substrings delimited by a whitespace.
- Return string contains the argument's substrings in opposite order and delimited with a comma and whitespace.
  - 'a b' => 'b, a'

**Implicit requirements:**

- How are non-alphabetical characters handled?
    - The test case doesn't suggest this needs to be considered.
- How are arguments with a middle name handled?
    - The test case doesn't suggest this needs to be considered.

**Mental Model:**

- Create a method that takes a string argument.  Split the argument into an array using a whitespace delimiter.  Join the array using a comma plus whitespace as a delimiter and return the string.

---
### Examples/Tests
```ruby
swap_name('Joe Roberts') == 'Roberts, Joe'
```
---
### Data Structures
Array.

---
### Algorithm
**swap_name(str)**
- take a string argument
- split the argument into an array using a whitespace delimiter
- join the array using a comma plus whitespace as a delimiter
- return the string

---
### Code
*see `07_swap_name.rb`*
