### Understanding the Problem
Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after `n` repetitions.

**Explicit Requirements:**

- Input: An integer.
- Return: An array.
- Input is the total number of times (round) that lights are switched on or off.
- Return is a list that identifies which lights are turned on after input's repetitions.
- Number of lights is based on input.
- Iterates through numbers from 1 to input.
- Each round switches lights based on multiples of the current round number (Round 2 selects 2, 4, 6, etc.  Round 3 selects 3, 6, 9, etc.).
- If a light is selected to be switched, it is switched to the opposite (on is switched off, off is switched on).

**Implicit requirements:**

- Can input be a Float?
    - No, must be an Integer.
- Do all odd rounds turn on lights?
    - No.  They switch on if the light is off, or switch off if the light is on.

**Mental Model:**

- Create a method that takes an integer argument.  The argument is used to create an array of 2-element sub-arrays.  The number of sub-arrays is equal to the argument.  The sub-array's elements are the sub-array's index plus 1, and `false`.  Next, loop argument times through the array.  On each iteration, use the current iteration number to select multiples of itself which equal sub-arrays first element.  If a sub-array's first element matches, reverse and mutate its second element from `false` to `true` or `true` to `false`.  After the loop ends, remove all sub-arrays with `false`.  Remove all second elements from the sub-arrays, flatten the array, and return it.

- Create a method that takes an integer argument.  Create an array with argument number `false` elements.  Loop argument times through the array's elements.  On each iteration, use the current iteration number to select multiples of elements' index plus 1.  If selected, reverse and mutate the current boolean (`false` to `true`, or `true` to `false`).  After the loop ends, return an array with the index plus 1 of all `true` boolean elements.

---
### Examples/Tests
```ruby
flip_lights(5) == [1, 4]
flip_lights(10) == [1, 4, 9]
```
---
### Data Structures
Array.

---
### Algorithm
**flip_lights(num_of_lights)**
- take an integer argument
- initialize a variable with an array of argument number elements
  - elements are all `false`
- initialize a counter variable set to 0
- while counter is < argument, loop through array's elements:
  - if element has index + 1 % counter == 0
    - reverse element's boolean
  - counter += 1
- loop through array's elements and return a new array:
  - if `true`
  - return index + 1

---
### Code
*see `04_flip_lights.rb`*
