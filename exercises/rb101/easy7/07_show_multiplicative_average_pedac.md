### Understanding the Problem
Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

**Explicit Requirements:**

- Input: An array of integer elements.
- Output: A string.
- Array's elements are multiplied together, then divided by the array's size.
- Output string returns the arithmetic result to 3 decimal places (0.000)
- Input is assumed to always have elements.

**Implicit requirements:**

- Does the output number have to return with 3 decimal places if it is an an integer?
    - Yes.
- Is there a desired format for the string output?
    - `"The result is #{float_num}"`

**Mental Model:**

- Take an array argument.  Multiply the array's elements with each other, divide by the size of the array, and return a Float number.  If the Float number to ensure it has exactly 3 decimal places, appending `0` when required.  Output the number in a string.

---
### Examples/Tests
```ruby
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
```
---
### Data Structures
Array.

---
### Algorithm
**show_multiplicative_average**
- take an array argument
- multiply the array's elements with each other
- convert the total to a float
- divide the total with the array's size
- format the number to have 3 decimal places
- output a string with the number interpolated

---
### Code
*see `07_show_multiplicative_average.rb`*
