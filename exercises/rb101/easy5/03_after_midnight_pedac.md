### Understanding the Problem
Write two methods.  They both take a single string as an argument and return an integer.  One method returns the number of minutes after midnight, the other returns the number of minutes before midnight- based on the argument.

**Explicit Requirements:**

- Input: A string.
- Return: An integer.

**Implicit requirements:**

- 

**Mental Model:**

- Write two methods.  They both take a single string as an argument and return an integer.
  - One takes the first two characters of the string converted to a number, multiplies the number by 60 (minutes/hour), then adds the last two characters of the string as a number.  Returns the value.

- The second method uses the first method, and subtracts it from zero.  Returns the value.

---
### Examples/Tests
```ruby
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
```
---
### Data Structures
None.

---
### Algorithm
**after_midnight**
- Create a method that accepts a single string argument
- Convert hours and minutes to integers, then add minutes to hours times 60
  - Convert the first two substrings (hrs) into an integer
  - Convert the last two substrings (min) into an integer
  - Multiply hrs by 60 (min/hr) and add min
- If return is 1440 (min/day), return
- Return value

**after_midnight**
- Create a method that accepts a single integer argument
- Pass argument to `after_midnight` to convert to minutes
- Subtract minutes from `0`
- Return value

**FUTURE EXPLORATION**
- Import `Time` class

**after_midnight**
- Set time to midnight using `Time` or `Date`
- Use `Time` or `Date` method to read hours and minutes
- Return as minutes

present = Time.new.to_s.split(/ /)[0].split(/-/) # sets an array: [year, month, day]
future = Time.new(present[0], present[1], present[2]) # sets a time object with the current date, but with the time set to midnight

**before_midnight**
- Set time to midnight using `Time` or `Date`
- Use `Time` or `Date` method to read hours and minutes
- Return as minutes

---
### Code
*see `03_after_midnight.rb`*
