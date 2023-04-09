### Understanding the Problem
Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

| Numerical Score Letter | Grade |
| :--------------------: | :---: |
| 90 <= score <= 100 | 'A' |
| 80 <= score < 90 | 'B' |
| 70 <= score < 80 | 'C' |
| 60 <= score < 70 | 'D' |
| 0 <= score < 60 | 'F' |

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

**Explicit Requirements:**

- Input: Three numbers.
- Return: A string.
- Return value is determined by the mean average of input numbers.
- Mean is sum total of numbers divided by quantity of numbers.
  - (10 + 20 + 30) / 3 = 20

**Implicit requirements:**

- Can there be an average above 100 or below 0?
    - Test cases do not suggest this needs to be considered.
- How are inputs above 100 handled?
    - Test cases do not suggest this needs to be considered.
- How are inputs below 0 handled?
    - Test cases do not suggest this needs to be considered.

**Mental Model:**

- Create a method that takes three number arguments.  Initialize a hash with string keys representing the grade (desired string output).  Set each key to the the appropriate numerical score (a range?).  Sum the input numbers and divide by 3, then set this return value to a variable.  Search the hash for a range that contains this value and return the key.
- Maybe it's better to make the range a key, and the string letter grade the value?

---
### Examples/Tests
```ruby
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
```
---
### Data Structures
Hash.

---
### Algorithm
**get_grade(score1, score2, score3)**
- take 3 number arguments
- initialize a hash:
  - keys are ranges representing numerical score
  - values are strings representing the desired string output (grade)
- sum the input numbers
- divide the sum by 3
- set the return value to a variable: `average`
- select the key which includes the `average`
- return the key's value

---
### Code
*see `09_get_grade.rb`*
