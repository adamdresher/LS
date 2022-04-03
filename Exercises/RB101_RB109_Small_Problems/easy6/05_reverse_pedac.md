### Understanding the Problem
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

**Explicit Requirements:**

- Input: An array.
- Mutate/Output/Return: A new array.
- Avoid using `Array#reverse` and `Array#reverse!`.
- Do not mutate the argument.
- Reverse the order of the argument's elements.

**Implicit requirements:**

- How should an empty array argument be handled?
    - Return a new empty array object.

**Mental Model:**

- 

---
### Examples/Tests
```ruby
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
```
---
### Data Structures
Array.

---
### Algorithm
**reverse**
- take an array argument
- initialize a variable set to an empty array
- iterate backwards through the argument:
  - pass the element to the new array
- return the new array

**reverse**
- take an array argument
- initialize a variable set to an empty array
- initialize a counter variable set to argument's size
- loop through argument's elements using counter to reference index:
  - break if counter is zero
  - counter -= 1
  - pass argument[counter] to new array
- return new array

---
### Code
*see 05_reverse.rb`*
