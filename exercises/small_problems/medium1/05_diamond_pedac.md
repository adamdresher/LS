### Understanding the Problem
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

**Explicit Requirements:**

- Input: An odd integer.
- Output: A multi-line string.
- The output uses `'*'` characters to make a diamond.
- The diamond is an `n` x `n`, where `n` is the input.

**Implicit requirements:**

- What are the buffer spaces in the output?
    - Whitespaces.
- How is a `0` input handled?
    - `Ruby considers `0` to be an even Integer.  
    - The problem states even number arguments do not need to be considered, so assume `0` does not need to be considered either.

**Mental Model:**

- Create a method that takes an odd integer argument.  Create an array of integer elements which symbolize the number of `'*'` required to output for each line.  Output enough whitespaces to buffer the diamond, then output the `*` to form the diamond.

-Divide `n` by 2 and round up to find the middle of the diamond.  Create an array of integers starting with `1` and adding `2` on each iteration and ending at `n`.  Copy the array, drop the last element, reverse the array and add its elements to the end of the original array.  Output enough whitespaces to reach the diamond, then output the `*` to form the diamond.

---
### Examples/Tests
```ruby
diamond(1)
# *

diamond(3)
#  *
# ***
#  *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

diamond(9, false)
#     *
#    * *
#   *   *
#  *     *
# *       *
#  *     *
#   *   *
#    * *
#     *
```
---
### Data Structures
Array.

---
### Algorithm
**diamonds(n)**
- take an odd integer argument: n
- loop through integers 1..n and return an array:
  - number if current number.odd?
- set array to diamond_top
- set copy of diamond_top to diamond_bottom
- remove last element of diamond_bottom
- reverse diamond_bottom
- set middle = n / 2
- set counter = n
- loop until counter == 0
  - if counter <= middle:
    - output ' ' * (middle - counter) + '*' * diamond_top[counter]
  - else
    - output ' ' * (counter - middle) + '*' * diamond_bottom[counter + middle]
  - counter += 1
---
### Code
*see `05_diamonds.rb`*
