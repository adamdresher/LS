### Understanding the Problem
Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

**Explicit Requirements:**

- Input: An array and a hash.
- Return: A string.
- Array argument contains 2 or more elements:
  - Elements are parts of a name.
- Hash argument contains two keys with appropriate values:
  - :title, :occupation
- Return string using arguments to create a greeting.

**Implicit requirements:**

- What are types of objects are the hash values?
    - Strings.
- Do the array's element strings need to be capitalized?
    - The test cases suggest this is not necessary.
- Do the hash string values need to be capitalized?
    - The test cases suggest this is not necessary.

**Mental Model:**

- Create a method that takes two arguments, an array and a hash.  Combine the array's elements with a whitespace between them and set to a variable.  Combine the hash's values with a whitespace between them and set to a variable.  Return a string with the two variables.

---
### Examples/Tests
```ruby
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.
```
---
### Data Structures
Array.
Hash.

---
### Algorithm
**greetings(arr, hsh)**
- take an array argument and hash argument.
- concatenate array elements with `' '`
  - set to a variable
- concatenate hash values with `' '`
  - set to a variable
- return a formatted string:
  - "=> Hello, #{name}! Nice to have a #{professional} around."

---
### Code
*see `01_greetings.rb`*
