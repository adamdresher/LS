### Understanding the Problem
Write a method that takes a positive integer, `n`, as an argument, and displays a right triangle whose sides each have `n` stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

**Explicit Requirements:**

- Input: An integer argument.
- Output: A text graphic.
- Use asterik, `*`, to create the graphic.
- Create a right triangle.
- The vertical side is on the right.
- `n` determines the length of the all sides.

**Implicit requirements:**

- Does the method mutate, return, or output?
    - Output.
- How is a negative number handled?
    - Problem and test cases imply only positive integers should be considered.
- How is the diagonal side created?
    - Whitespaces are used.
- How are the whitespaces determined?
    - `n` minus row number.

**Mental Model:**

- Create a method that takes an positive integer argument.  Initialize a counter variable set to `0`.  Loop through a block `n` times.  On each loop, add `1` to `counter`, output `n - counter` whitespaces plus `counter` asteriks.

---
### Examples/Tests
```ruby
triangle(5)

    *
   **
  ***
 ****
*****
```
---
### Data Structures
None.

---
### Algorithm
**triangle**
- take a positive integer argument, `length`
- initialize a counter variable set to: `0`
- loop `length` times:
  - counter += 1
  - output `' ' * (length - counter) + '*' * counter`

**triangle**
- take a positive integer argument: `length`
- initialize a variable set to a message asking user for the corner to output right angle from
- print message
- initialize a variable set to user's input and receive input
- pass argument and user input into print_triangle:

**print_triangle**
- if upper left:
  - initialize a counter variable set to: `0`
  - loop `length` times:
    - `counter += 1`
    - output `'*' * (length - counter)`

- elsif upper right
  - initialize a counter variable set to: `0`
  - loop `length` times:
    - `counter += 1`
    - output `' ' * counter + '*' * (length - counter)`

- elsif lower left
  - initialize a counter variable set to: `0`
  - loop `length times:
    - `counter += 1`
    - output `'*' * counter`

- elsif lower right
  - initialize a counter variable set to: `0`
  - loop `length` times:
    - `counter += 1`
    - output `' ' * (length - counter) + '*' * counter`

---
### Code:
*see `10_triangle.rb`*
