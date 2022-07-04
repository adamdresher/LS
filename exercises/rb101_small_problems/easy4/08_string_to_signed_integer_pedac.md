### Understanding the Problem
Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading `+` or `-` sign; if the first character is a `+`, your method should return a positive number; if it is a `-`, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as `String#to_i`, `Integer()`, etc. You may, however, use the `string_to_integer` method from the previous lesson.

**Explicit Requirements:**

- Input: A string of numbers.
- Return: An integer.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that accepts a string argument and returns a signed number.  First, the argument's first substring is checked for a positive or negative sign.  If a match is found, then remove and save it in a variable.  Next pass the updated argument into `#string_to_integer`.  Convert this integer to negative if the sign variable is negative.  Then return the integer.

---
### Examples/Tests
```ruby
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
```
---
### Data Structures
None.

---
### Algorithm
**string_to_signed_integer**
- initialize new method that takes a string argument: `string_to_signed_integer`
- initialize a boolean variable: `neg_sign = false`
- initialize an integer variable: `signed_integer = string`
- check if argument begins with a `+` or `-`
  - if `-` is found
    - remove from argument and make `neg_sign` `true`
  - else if `+` is found
    - remove from argument
- pass and update `signed_integer`'s value by passing into `string_to_integer`
- if `neg_sign` is `true`
  - multiply `signed_integer` by `-1`
- return `signed_integer`

---
### Code
*see `08_string_to_signed_integer.rb`*
