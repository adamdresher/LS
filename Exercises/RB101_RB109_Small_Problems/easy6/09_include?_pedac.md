### Understanding the Problem
Write a method named `include?` that takes an Array and a search value as arguments. This method should return `true` if the search value is in the array, fa`lse if it is not. You may not use the `Array#include?` method in your solution.

**Explicit Requirements:**

- Input: An array and a value.
- Return: A boolean.
- The method should accept two arguments: an array and a search value.
- The array argument is searched.
- The search value argument is the target value for searching.
- Return `true` if the search value is found, `false` if not found.

**Implicit requirements:**

- How is an empty value handled?
    - If the array is empty, the return value will be `false`.
    - This is not explicitly defined.  If the search value is empty, an argument error should be returned.
- How is a `nil` value handled?
    - If `nil` is an array element, `nil` must be the search value for a match.
    - If `nil` is the search value, `nil` must be an element in the array.
- How are duplicate matches handled?
    - This is not explicitly defined.  Return `true`.

**Mental Model:**

- Create a method that accepts two arguments, an array and a search value.  Iterate over the array and check if any element matches the search value.  If a match is found, break the loop and return `true`.

---
### Examples/Tests
```ruby
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
```
---
### Data Structures
Array.

---
### Algorithm
**include?**
- takes two arguments: an array and any single value
- initialize a counter variable set to: `0`
- loop:
  - return false if counter == array.size
  - if argument[counter] == single value:
    - return true
  - else:
    - counter += 1
 
---
### Code
*see `09_include?.rb`*
