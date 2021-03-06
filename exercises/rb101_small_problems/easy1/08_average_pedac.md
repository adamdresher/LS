### Understanding the Problem
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

**Explicit Requirements:**

- Input: An array of integers.
- Mutate/Output/Return: An Integer.

**Implicit requirements:**

- Are the elements always natural numbers?
    - Yes, they will always be positive integers.
- Will the parameter ever be an empty array?
    - No.
- What type of average is expected?
    - A arithmetic mean average.
- What should be returned, if the average is not a whole number?
    - Round down to the nearest whole integer.

**Mental Model:**

- Create a method called, `average` that takes an array parameter.  Check if the array's elements are all integers and return an error if false.  Add all the elements together and divide by the array's length, then return the result.

---
### Examples/Tests
```ruby
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
```
---
### Data Structures
Array.

---
### Algorithm
Algorithm 1:
- Create a method called, `average`, with a parameter called, `arr`.
- Iterate through `arr`'s elements.  If any aren't an integer or are negative, then return an error.
- Add all of `arr`'s elements together and divide by `arr`'s length, then return the result.

Algorithm 2 for Further Exploration:
- Create a method called, `average`, with a parameter called, `arr`.
- Iterate through `arr`'s elements.  If any are negative, then return an error.
- Add all of `arr`'s elements together, convert to a float and divide by `arr`'s length, then return the result.

---
### Code
*see `08_average.rb`*
