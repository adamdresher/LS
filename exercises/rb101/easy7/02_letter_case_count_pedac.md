### Understanding the Problem
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

**Explicit Requirements:**

- Input: A string.
- Return: A hash with 3 key-value sets.
- The key-value sets are: # of lowercase characters, # of uppercase characters, # of neither lowercase or uppercase characters.

**Implicit requirements:**

- How is an empty string handled?
    - The hash returns with its keys' values set to 0.
- How are non-alphabetical characters handled?
    - They are counted in the third key-value set, neither lowercase or uppercase.

**Mental Model:**

- Create a method that takes a string argument.  Initialize an empty hash.  Count how many characters in the argument match requirements for lowercase, uppercase, and neither, then set a key to the count's return.  Return the hash.
lowercase matches letters `/[a-z]/`
uppercase matches letters `/[A-Z]/`
neither matches `/[^a-zA-Z]/`.

---
### Examples/Tests
```ruby
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
```
---
### Data Structures
Hash.

---
### Algorithm
**letter_case_count**
- take a string argument
- initialize an empty hash:
- count how many characters in the argument match `/[a-z]/` and set to `hash[:lowercase]`
- count how many characters in the argument match `/[A-Z]/` and set to `hash[:uppercase]`
- count how many characters in the argument match `/[^a-zA-Z]/` and set to `hash[:neither]`

---
### Code
*see `02_letter_case_count.rb`*
