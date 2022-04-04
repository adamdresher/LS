### Understanding the Problem
Write a method that searches for all multiples of `3` or `5` that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is `20`, the result should be `98` `(3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20)`.

You may assume that the number passed in is an integer greater than 1.

**Explicit Requirements:**

- Input: An integer.
- Return: An integer.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that takes an integer argument, then sets a range from `1` to argument.  Iterate through the range and assign multiples of `3` or `5` to an array.  Then output the sum of the array's elements.

---
### Examples/Tests
```ruby
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
```
---
### Data Structures
Array.

---
### Algorithm
**multisum**
- START

- SET `arr` = range from `1` to argument
- SET `count = 0`
- SET `sum = []`
- WHILE `count` < size of `arr`
  - IF `arr[count]` divided by `3` or `5` == `0`
    - THEN push `count` to `sum`
  - `count += 1`
- SET `sum` to the sum of all its elements.
- RETURN `sum`

- END

---
### Code
*see `05_multisum.rb`*
