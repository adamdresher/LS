### Understanding the Problem
Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

**Explicit Requirements:**

- Input: 6 numbers via user input.
- Output: A string.

**Implicit requirements:**

- 

**Mental Model:**

- Write a program that asks the user for a number 6 times.  Create a list using the first 5 numbers and check if any listed numbers match the 6th number.  Output whether or not the list matches.

---
### Examples/Tests
```ruby
# Example input:
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17

# Output:
The number 17 appears in [25, 15, 20, 17, 23].

# Example input:
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18

# Output:
The number 18 does not appear in [25, 15, 20, 17, 23].
```
---
### Data Structures
Array.

---
### Algorithm
- START

- SET list = empty array
- WHILE iterator <= 6
  - LOOP
    - PRINT request iterator/6 input.
    - IF input == integer
      - SET list += input
      - iterator += 1
    - ELSE 
      - PRINT error
    - go to next iteration

- SET target = last number of array
  - remove target from array
- WHILE iterator <= length of array
  - IF element == target
    - PRINT target is in the list
    - BREAK
  - ELSE
    - iterator += 1
  - go to the next iteration
  - PRINT target is not in the list
  
- END

---
### Code
*see `01_searching_101.rb`*
