### Understanding the Problem
Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

**Explicit Requirements:**

- Input: Given integers 1..99.
- Output: Integers.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that outputs a successive even number on a new line starting with 1 and ending with 99.

---
### Examples/Tests
```ruby
2
4
..
96
98
```
---
### Data Structures
None.

---
### Algorithm
Algorithm 1:
- START
- SET iterator = 1
- WHILE iterator < 99
  - IF iterator is even
    - PRINT iterator
  - SET iterator += 1
  - next iteration
- END

---
### Code
*see `07_even_numbers.rb`*
