### Understanding the Problem
Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

**Explicit Requirements:**

- Input: 4 user inputs.
- Output: 5 strings.
- User inputs are:
  - noun, verb, adverb, adjective
- The first 4 outputs are string prompts for user input.
  - `Enter a noun:`
  - `Enter a verb:`
  - `Enter a adjective:`
  - `Enter a adverb:`
- The last string output is formatted with return values from user inputs.
  - `Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!`

**Implicit requirements:**

- Should the user inputs be validated for grammatical correctness?
    - The problem does not mention this.  Validating for grammtically correct words seems beyond the scope of the problem's intended purpose.  This will not be attempted.

**Mental Model:**

- Initialize an empty hash with 4 empty keys, 1 for each word type.  Iterate through the hash's keys.  On each iteration, prompt the user for a word and assign the word to the key.  Use the hash's key-value pairs to return a formatted string.

---
### Examples/Tests
```ruby
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!
```
---
### Data Structures
None.

---
### Algorithm
**mad_libs**
- Initialize an empty hash with 4 empty keys, 1 for each word type:
  - words = { noun: '', verb: '', adjective: '', adverb: '' }
- Iterate through the hash's keys
  - prompt the user for a word using key represented as a string
    - assign the word to the key
- Use the hash's key-value pairs to return a formatted string:
  - `Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!`

---
### Code
*see `02_madlibs.rb`*
