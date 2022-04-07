### Understanding the Problem
Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

**Explicit Requirements:**

- Input: An array of integer elements.
- Return: An integer.
- Array arguments are unordered.
- Exactly one integer value occurs twice in the array argument.
  - All other values occur exactly once in the array argument.

**Implicit requirements:**

- Can a value occur more than twice instead of only twice?
    - No.

**Mental Model:**

- Create a method that accepts an array argument.  Iterate through the argument's elements, counting how many occurrences of the element are found.  If two occurrences are found, stop and return the vallue.

---
### Examples/Tests
```ruby
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
```
---
### Data Structures
Array.

---
### Algorithm
**find_dup**
- take an array argument
- iterate through argument's elements:
  - count how many occurrences of the element are found in the argument
  - if two occurrences, return value

**find_dup**
- take an array argument
- set a variable, `counter = 0`
- set a variable, `match_counter = `0`
- set a variable, `current_ele` = nil`
- iterate through argument's elements `until argument.size == counter + 1`:
  - set `current_ele = argument[counter]`
  - iterate through argument's elements:
    - set `dup = argument[match_counter] if argument[match_counter] == current_ele`
  - `return dup if dup == current_ele`
  - set `match_counter += 1`
- `return dup`

---
### Code
*see `08_find_dup.rb`*
