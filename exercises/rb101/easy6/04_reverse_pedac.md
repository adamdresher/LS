### Understanding the Problem
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

**Explicit Requirements:**

- Input: An array.
- Mutate & return: The array argument.
- Reverses the order of Array's elements.
- The array's elements themselves should return as the same objects with new index.

**Implicit requirements:**

- 

**Mental Model:**

- Write a method that accepts an array argument.  Initialize a new, empty array.  Iterate through the argument, removing the last element from the argument and adding it to the new array.  Continue until the argument is empty.  Iterate through the new array, adding the first element to the argument.  Continue until the new array is empty.  Return the same array object.

- Write a method that accepts an array argument.  Iterate through the argument, converting each element into a nested array: `[self, array's size - self's index]`.  Mutate and sort array by nested array's second element.  Iterate through the argument, removing the second element of each nested array.  Mutate and flatten the array.  Return the same array object.

- Ex.
list = [1, 2, 3, 4]
- list.size = 4
- iterating for element's new placement:
- 4's index is 3
  - 4's reverse index is 0: list.size - (4's index + 1)
- 3's index is 2
  - 3's reverse index is 1: list.size - (3's index + 1)
- 2's index is 1
  - 2's reverse index is 2: list.size - (2's index + 1)
- 1's index is 0
  - 1's reverse index is 3: list.size - (1's index + 1) 

---
### Examples/Tests
```ruby
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
```
---
### Data Structures
Array.

---
### Algorithm
**reverse!**
- accept an array argument
- initialize a new, empty array
- iterate backwards through the argument's elements:
  - add the element to the new array
- iterate through the new array's elements
  - assign the element to argument[element's index]
- return the argument

**reverse!**
- accept an array argument
- iterate through the argument's elements:
  - convert the element into an array: `[element, array.size - element's index]`
- sort argument based on nested array's second element, mutating self
- iterate through the argument:
  - remove the second element of each nested array
- flatten the array, mutating self
- return same array object

---
### Code
*see `04_reverse.rb`*
