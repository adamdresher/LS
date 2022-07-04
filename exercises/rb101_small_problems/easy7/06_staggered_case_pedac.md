### Understanding the Problem
Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.
- New string's alphabetical characters alternate between uppercase and lowercase.
- Non-alphabetical characters are returned, unmodified.
- Non-alphabetical characters are not counted for alternating cycle.

**Implicit requirements:**

- Does the return string start with an uppercase or lowercase character?
    - Uppercase character.

**Mental Model:**

- Create a method that accepts a string argument.  Split the argument into an array of substrings.  Iterate through the array's substrings.  If the substring is not an alphabetical character, skip character and move to the next iteration.  If the substring's index is even, upcase the character.  Else downcase the character.  Join the array with `''` as a delimiter and return a new string.

- Create a method that accepts a string argument and two boolean arguments.  Initialize a new, empty string.  Split the string argument into an array of substrings.
If boolean1 is set for alpha characters to be staggered, ignore non-alpha characters.  Else iterate over all characters.
If boolean2 is set for the first character to be upcased, set if/else to upcased/downcased.  Else set if/else to downcased/upcased.
Iterate through the array's elements are add the return values to the new string.  On each iteration, iterate over characters based on boolean1.  Modify the following if/else block based on boolean2:
If character is index 0, upcase character.  If last character is upcased, current character is downcased.  Else upcase current character.
Return the new string.
---
### Examples/Tests
```ruby
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
# Further Exploration.
p test = '!!!!I\'m testing "non-alpha chars and the first char.'
p staggered_case(test, true, true)
p staggered_case(test, true, false)
p staggered_case(test, false, true)
p staggered_case(test, false, false)
```
---
### Data Structures
Array.

---
### Algorithm
**staggered_case**
- take a string argument
- initialize a new, empty string
- split the argument into an array of characters
- iterate through the array's elements and add the return values to the new string:
  - if element's index is 0 || previous element is downcase
    - element.upcase
  - else
    - element.downcase
- join array
- return new string

**staggered_case** # Further Exploration.
- take a string argument and two boolean arguments (booleans: start_upcase, all_char)
- check if start_upcase can be mutated and the mutation persists through iterations
  - if mutations do not persist, set a new variable to start_upcase's value

- initialize a new, empty string
- iterate through the array's elements:
  - if all_char is true
    - pass element and start_upcase to swap_case
      - push return value to new string
  - !start_upcase

  - elsif all_char is false
    - if element doesn't match the alphabet
      - push element to new string
    - else
      - pass element and start_upcase to swap_case
        - push return value to new string
      - !start_upcase
- return a new string

**swap_case**
- take a string argument and start_upcase
- if the boolean argument is true
  - string.upcase
- else
  - string.downcase
---
### Code
*see `06_staggered_case.rb`*
