### Understanding the Problem
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the `palindrome?` method you wrote in the previous exercise.

**Explicit Requirements:**

- Input: A string.
- Return: A boolean.

**Implicit requirements:**

- Is this case-sensitive?  
    - No.
- Are special characters considered?
    - No.
- Are whitespaces considered?
    - No.

**Mental Model:**

- Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the `palindrome?` method you wrote in the previous exercise.

---
### Examples/Tests
```ruby
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
```
---
### Data Structures
None.

---
### Algorithm
**real_palindrome?**
- START

- READ string
- downcase string
- remove non-alphanumeric characters
- SET string_reversed to the reverse order of string's characters
- compare string to string_reversed
- RETURN boolean

- END

---
### Code
*see `09_real_palindrome?.rb`*
