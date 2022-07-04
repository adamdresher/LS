### Understanding the Problem
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

**Explicit Requirements:**

- Input: An array.
- Return: A new array.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that takes an array of integers between 0..19.

- Create a CONSTANT hash with numbers as keys and their English spelling as values.  Iterate through the array argument and compare the elements to the CONSTANT hash.  If a match is found, select and return the value in a new array.  Sort and mutate the new array by alphabetical order.  Iterate and mutate through the new array and compare it to the CONSTANT hash's keys.  If a match is found, return the key's value.  Return the new array.

- Create a CONSTANT array with numbers as keys and their index based on their English names' alphabetical order.
  - This seems to defeat the purpose of the problem.

- Create a CONSTANT nested array where each nested array element contains: [number's English name, number].  The nested array elements should be sorted based on their first elements' indice.  Iterate through CONSTANT array.  On each iteration, compare the element array's second element to the array argument.  If there is a match, select and return the number as part of a new array.

---
### Examples/Tests
```ruby
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
```
---
### Data Structures
Array.

---
### Algorithm
**alphabetic_number_sort** using CONSTANT nested array
- set a CONSTANT nested array with nested array elements which contain: [number's English name, number]
- create a copy of the argument
- iterate through the CONSTANT array's nested array elements:
  - compare the current nested array's second element to the argument copy
  - if a match is found
    - remove the element from the argument copy
    - return the element as part of a new array
- sort new array based on the alphabetical order of the nested arrays' first element
- iterate through the new array:
  - remove the first element of each nested array
- flatten the array
- return the new array

**alphabetic_number_sort** using CONSTANT hash
- set a CONSTANT hash with keys set to incremental numbers (1..19) and values set to the corresponding English spelling.
- iterate through the array argument:
  - compare elements to the CONSTANT hash keys
  - if a match is found
    - select and return the value in a new array
- sort and mutate the new array based on elements' alphabetical order
- iterate through the new array:
  - compare the elements to the CONSTANT hash keys
  - if a match is found
    - return the key's value
- return the new array

---
### Code
*see `08_alphabetic_number_sort.rb`*
