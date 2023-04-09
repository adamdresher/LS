### Understanding the Problem
Write a method that returns an Array that contains every other element of an `Array` that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

**Explicit Requirements:**

- Input: An array.
- Return: An array.

**Implicit requirements:**

- Is the first element returned index 0 or 1?
    - Index 0.
- Does it matter what the elements are?
    - No, it doesn't seem to.
- How does the method respond to an empty array as an argument?
  - It returns an empty array.

**Mental Model:**

- Create a method called `oddities()` that takes an array as an argument and returns an array of every other element from argument- starting with the first element.

Mental Model, Further Exploration:
- Create a method called `oddities()` that takes an array as an argument.  First it removes the first two elements, then returns a new array of every other element- starting with the first element.

- Create a method called `oddities()` that takes an array as an argument.  It returns a new array of every other element- starting with the third element.

---
### Examples/Tests
```ruby
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
```
---
### Data Structures
Array.

---
### Algorithm
- START

- new_arr = []
- READ argument
- WHILE iterating
  - READ element's index
  - IF index is even
    - push current element to new_arr
  - ELSE
    - next iteration
- new_arr

- END


FURTHER EXPLORATION 1:
- START

- new_arr = []
- READ argument
- WHILE iterating
  - READ element's index
  - IF index is odd
    - push current element to new_arr
  - ELSE
    - next iteration
- new_arr

- END


FURTHER EXPLORATION 2:
- START

- new_arr = []
- READ argument
- select elements with index 1..-1
- WHILE iterating
  - READ element's index
  - IF index is even
    - push current element to new_arr
  - ELSE
    - next iteration
- new_arr

- END


FURTHER EXPLORATION 3:
- START

- new_arr = []
- READ argument
- WHILE iterating
  - READ element's index
  - IF index has a modulo of 1.
    - push current element to new_arr
  - ELSE
    - next iteration
- new_arr

- END
---
### Code
*see `07_oddities.rb`*
