### Understanding the Problem
Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

**Explicit Requirements:**

- Input: An array.
- Return: A new array.
- Input array contains nested, two element arrays.
  - Nested arrays' elements are a String and a number.
- Return array is an array of String objects.
- The Strings in the argument's nested arrays are returned n times in the return array.
  - n is the second element is the nested arrays.

**Implicit requirements:**

- How is a nested array containing a plural string element and a number 1 handled?
    - The test cases do not indicate this should be considered.
- How is a nested array containing a singular string element and a number greater than 1 handled?
    - The test cases do not indicate this should be considered.
- How should nested arrays containing the same String objects be handled?
    - The test cases do not indicate this should be considered.
- How should nested arrays containing the same String objects, but plural and singular, be handled?
    - The test cases do not indicate this should be considered.

**Mental Model:**

- Create a method that accepts a 2 level array argument.  Iterate through the arguments nested arrays and transform the array elements to return a new array.  On each iteration, multiply the first element (a String) by the second element (a number) and return to the block a number of string elements.  Return the new array.

---
### Examples/Tests
```ruby
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
```
---
### Data Structures
Arrays, nested.

---
### Algorithm
**buy_fruit(list)**
- accept a 2 level array argument
- iterate through the arguments nested arrays and transform the array elements to return a new array:
  - multiply the first element (a String) by the second element (a number)
  - return to the block a number of string elements
- return the new array

---
### Code
*see `10_buy_fruit.rb`*
