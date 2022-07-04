### Understanding the Problem
Write a method that can rotate the last n digits of a number.

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

**Explicit Requirements:**

- Input: Two Integers: `number`, `n`
- Return: A new Integer.
- The last `n` digits of `number` are rotated.
- `n` is always a positive integer.
- If 1 digit is rotated, the `number` is returned unmodified.

**Implicit requirements:**

- How are the numbers rotated?
    - The first digit of the last `n` digits becomes the last digit in the return number.
- Does the rotated number go to the front of the return 

**Mental Model:**

- Create a method that takes two integer arguments.  Split the argument into an array of digits.  Remove the `n`th element and put it as the first element in the array.  Reverse the order of the array.  Return the array.

---
### Examples/Tests
```ruby
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
```
---
### Data Structures
Array.

---
### Algorithm
**rotate_rightmost_digits**
- take two integer arguments: `num`, `n`
- split `num` into an array of digits
- select and remove `num[n-1]`
  - add it to the front of the array
- reverse the order of the array
- join the array into a string
- convert the string into an integer
- return the integer

---
### Code
*see `02_rotate_rightmost_digits.rb`*
