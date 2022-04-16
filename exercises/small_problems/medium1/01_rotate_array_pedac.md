### Understanding the Problem
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method  `Array#rotate` or `Array#rotate!` for your implementation.

**Explicit Requirements:**

- Input: An array.
- Return: A new array.
- Return array's first element becomes the last element, while the rest are moved left by one.
- Do not use `Array#rotate` or `Array#rotate!`.

**Implicit requirements:**

- How is an empty input array handled?
    - A new empty array is returned.
- How is a 1-element input array handled?
    - A new 1-element array is returned.
 - Can the input array's elements be any object?
    - Yes.

**Mental Model:**

- Create a method that takes an array argument.  If argument is empty, return a new, emtpy array.  Else split argument into two arrays.  The first array contains the argument's first element.  The second array contains the rest of argument's elements.  Return the second argument with the first array's element added to the end.

---
### Examples/Tests
```ruby
rotate_object([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_object(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_object(['a']) == ['a']
# Further Exploration
rotate_object([]) == []
rotate_object('abcde') == "bcdea"
rotate_object('') == ''
rotate_object(12345) == 23451
rotate_object({ a: [1, 2, 3], b: ['aardvark', 'bison', 'catapillar'], c: 'hello' }) == { b: ['aardvark', 'bison', 'catapillar'], c: 'hello', a: [1, 2, 3] }
rotate_object({}) == {}
```
---
### Data Structures
Array.

---
### Algorithm
**rotate_array**
- take an array argument
- if array is empty
  - return new, empty array
- split argument into two new arrays:
  - first array contains argument[0]
  - second array contains argument[1..]
- return first array + second array

---
### Code
*see `01_rotate_array.rb`*
