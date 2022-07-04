### Understanding the Problem
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the `rotate_rightmost_digits` method from the previous exercise.

Note that you do not have to handle multiple 0s.

**Explicit Requirements:**

- Input: An integer.
- Return: An integer.
- Can use `rotate_rightmost_digits`.
- Do not need to handle multiple 0s.
- Return number is repeatedly rotated.
  - Each reptition shifts the first number to the end.
  - Each repetition ignores the first number of self.
    - This results in each repetition uses one less number than the last repetition.
    - The repetition and rotation ends when there is only 1 number to rotate.

**Implicit requirements:**

- How are 0s handled?
    - If `0` becomes a leading number, it is dropped (inherit to how numbers are handled in Ruby).

**Mental Model:**

- Create a method that takes an integer argument.  Initialize a counter set to argument's size.  Loop while counter is greater than 0.  Pass the argument and counter into `rotate_rightmost_digits`.  Set return value to argument.  Subtract 1 from counter.  After loop breaks, return argument.

---
### Examples/Tests
```ruby
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
```
---
### Data Structures
Array.

---
### Algorithm
**max_rotation**
- take an integer argument
- initialize a counter variable: counter = argument.digits.size
- loop while counter > 0:
  - argument = rotate_rightmost_digits(argument, counter)
  - counter -= 1
- return argument

---
### Code
*see `03_max_rotation.rb`*
