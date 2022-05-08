### Understanding the Problem
Write a program that takes an array of words and prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order.

**Explicit Requirements:**

- Input: An array containing String objects.
- Output: String representations of arrays containing String elements.
- An anagram is defined by at least two words found which consist of the same characters, but in a different order.

**Implicit requirements:**

- How many orders of the same letters are required to define an anagram?
    - At least two unique orders the letters are must be identified to create an anagram.
- Are the argument's elements always single word String objects?
    - Yes, the test case suggests all of the argument's elements are single word String objects.
- How are multiple anagrams displayed?
    - All String objects that are the same anagram are returned as elements in the same Array.
    - A new array is displayed for each anagram type found.
- Does the order of String objects in each displayed array matter?
    - The test case suggests that the String objects should be in alphabetical order.


**Mental Model:**

- Create a method that takes an array argument.  Initialize a variable assigned to a new, empty Array object.  Iterate through the array argument's String objects.  On each outer iteration, iterate through the array argument's elements.  On each inner iteration, select all String objects that contain the same letters and number of letters as the outer iteration's current String object.  Return the new array from inner iteration to the outer iteration.  In the outer iteration, push this array as an element to the top level empty array if this array is not already included.  After the outer iteration is complete, return the top level array.

---
### Examples/Tests
```ruby
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

display_anagrams(words)
# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)
```
---
### Data Structures
Array.

---
### Algorithm
**display_anagram(arr)**
- take an Array argument
- initialize a variable assigned to a new, empty Array object (top level)
- iterate (outer) through the Array object argument's String object elements:
  - iterate (inner) through the Array object argument's String object elements:
    - sort the inner String object element's characters and the outer String object element's characters
    - if current inner element contain the same letters as current outer element
      - if current inner element contains the same number of letters as current outer element
        - select the current inner element
  - return a new Array object of selected elements
- unless all of the new Array object's elements match all of the elements within a nested array in top level Array object
  - push the new Array object as an element to the top level empty Array object
- return the top level Array object

---
### Code
*see `11_display_anagrams.rb`*
