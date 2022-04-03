### Understanding the Problem
Write a method that will take a short line of text, and print it within a box.
You may assume that the input will always fit in your terminal window.

**Explicit Requirements:**

- Input: A string.
- Output: A new multiline string.
- The string argument is returned within a text box.
- The string argument always fits within a terminal window.

**Implicit requirements:**

- What is the box's border made from?
    - Plus, `+`, for corners.
    - Dash, `-`, for the width.
    - Line dividers, `|`, for the height.
- How is the size of the box determined?
    - The width of the box is the length of the string plus 4 characters.
      - 4 == 2 whitespaces + 2 borders (before and after the string argument).
    - The height of the box is the number of lines for the string argument plus 4 characters.
      - 4 == 2 new lines + 2 borders (above and below the string argument).
- How is an empty string argument handled?
    - An empty box is returned.
- What are the dimensions of an empty box?
    - 4 characters wide (2 dashes + 2 pluses).
    - 5 characters tall (3 line dividers + 2 pluses).

**Mental Model:**

- Create a method that takes a string argument.  Create an array of 5 elements.  Each element is a line of the box.  The array is an empty box.  Next, the string argument's length is used to add dashes to the center of the first and last elements, whitespaces to the center of the second and fourth elements.  The string argument is added to the center of the third element.  Then the array is printed.

box = [
  ['+--+'],
  ['|  |'],
  ['|  |'],
  ['|  |'],
  ['+--+']
]

---
### Examples/Tests
```ruby
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
```
---
### Data Structures
Array.

---
### Algorithm
**print_in_box**
- create array of 5 elements
  - 1st element is upper border : '+--+'
  - 2nd element is upper buffer : '|  |'
  - 3rd element is middle buffer: '|  |'
  - 4th element is lower buffer : '|  |'
  - 5th element is lower border : '+--+'
- set argument's length to a variable: `str_width`
- add `str_width` number of dashes, `'-'`, to the 1st and 5th elements after index 1
- add `str_width` number of whitespaces, `' '` to the 2nd and 4th elements after index 1
- add argument to the 3rd element after index 1
- `puts` array


***Solution 2***
- initialize a CONSTANT variable and set to 76 (80 - 2 border character and 2 buffer characters)
**print_in_box**
- if string's length is greater than CONSTANT
  - set `width` to CONSTANT
- else
  - set `width` to string's length

- set `horizontal_line` to `'+'` plus `'-'` times (`width` plus 2) plus `'+'`
- set `buffer_line` to `'|'` plus `'-'` times (`width` plus 2) plus `'|'`
- set `message` to return value of `string` passed to `split_text`

- puts `horizontal_line`
- puts `buffer_line`
- puts `multiline_string`
- puts `buffer_line`
- puts `horizontal_line`

**split_text**
-initialize an empty array
- loop
  - if string's length is greater than CONSTANT
    - remove first 76 characters
    - `'| '` plus removed characters plus `' |'`
    add to array
  - else
    - set `filler` to 76 minus length of remaining characters
    - `'| '` plus remaining characters plus `filler` plus `' |'`
    - add string to array
  - break when string's length is less than 76
- return array 

---
### Code
*see `10_print_in_box`*
