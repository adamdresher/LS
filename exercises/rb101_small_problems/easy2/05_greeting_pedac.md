### Understanding the Problem
Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

**Explicit Requirements:**

- Input: User's input as a string.
- Output: A new string

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that asks user for her/his name.  If input's last character is `!`, output a string in all caps.  If the last character is not an `!`, then output a string like a civilized computer.

---
### Examples/Tests
```ruby
What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
```
---
### Data Structures
None.

---
### Algorithm
Algorithm 1:
- START
- GET user's name
  - SET input to `name`
- READ `name` in reverse
  - IF `name`'s first character = `!`
    - PRINT string with `name` in all caps.
  - ELSE
    - PRINT string with `name`.
- END

---
### Code
*see `05_greeting.rb`*
