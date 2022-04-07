### Understanding the Problem
The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

**Explicit Requirements:**

- Input: An integer.
- Return: A boolean.

**Implicit requirements:**

- What happens if the year is divisible by 100?
    - If it's also divisible by 4, then it is a leap year.
    - Else it is not a leap year.
- What if the year is negative?
    - Ignore this edge case.

**Mental Model:**

- Adapt the method created in part 1 so that any year before 1752 and divisible by 4 is a leap year.

---
### Examples/Tests
```ruby
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
```
---
### Data Structures
None.

---
### Algorithm
**leap_year?**
- START

- IF year <= 1752
  - check if divisible by 4
- ELSE
  - invoke method from part 1

- END

---
### Code
*see `04_leap_year?`*
