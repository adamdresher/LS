### Understanding the Problem
Write a function named `xor` that takes two arguments, and returns `true` if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by `||` and `&&.`

**Explicit Requirements:**

- Input: 2 arguments.
- Return: A boolean.

**Implicit requirements:**

- Can the arguments be complex expressions?
    - Test cases are a single method with a caller, but more complex conditions should be fine.
- Can `nil` be passed as an argument?
    - Yes, that will evaluate as falsy.
- Can the arguments be literals?
    - Yes.

**Mental Model:**

- Create a method called `xor()` that takes 2 arguments and returns `true` if exactly 1 argument is `true`, else `false`.

---
### Examples/Tests
```ruby
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
```
---
### Data Structures
None.

---
### Algorithm
**xor?**
- START

- SET counter = 0
- IF argument1 then counter += 1
- IF argument2 then counter += 1

- IF counter == 1
  - true
- ELSE
  - false

- END

---
### Code
*see `06_xor?.rb`*
