### Understanding the Problem
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

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

- Create a method that accepts `year` as an integer argument.  Check if `year` is divisible by `4`.  Return boolean if `false`.  If `true`, check if also divisible by `100`.  If `true`, check if also divisible by `400`.  Return boolean.

check if divisible by 4
  check if divisible by 100
    check if divisible by 400
    return boolean (true == divisible by 400, false == !divisible by 400 but divisible by 100)
  else false
    return boolean (false == not divisible by 4)
  end

def check_modulo(cycle, year)
  year % cycle == 0
end

if check_year_modulo(4)
  check_year_modulo(400) unless check_year_modulo(100)
end

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

- IF year % 4 == 0
  - IF year % 400 == 0,
    - true
  - ELSIF year % 100 == 0,
    - false
  - ELSE
    - true
- ELSE
  - false

- END

---
### Code
*see `03_leap_year.rb`*
