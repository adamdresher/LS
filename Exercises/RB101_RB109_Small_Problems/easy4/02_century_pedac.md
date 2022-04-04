### Understanding the Problem
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with `st`, `nd`, `rd`, or `th` as appropriate for that number.

New centuries begin in years that end with `01`. So, the years 1901-2000 comprise the 20th century.

**Explicit Requirements:**

- Input: An integer.
- Return: A string.

**Implicit requirements:**

- How is a year ending in `00` handled?
    - It is the last year of a century.
- How is a year ending in `01` handled?
    - It is the first year of a century.

**Mental Model:**

- Create a method that accepts a year as an argument in the form of an integer.  Subtract `1` from the integer, then split the return into an array of characters.  Remove the last two elements, rejoin the elements as an integer, add `1`, and convert the integer back to a string.  If the string is `('11'..'13')`, then concat `'th'`.  Else if the last character is `'1'`, then concat `'st'`.  Else if the last character is `'2'`, then concat `'nd'`.  Else if the last character is `'3'`, then concat `'rd'`.  Else concat `'th'`.

1799 == 18th
1800 == 18th
1801 == 19th

1799 - 1 = 1798 => remove last two substring = 17 => 17 + 1 = 18th
1800 - 1 = 1799 => remove last two substring = 17 => 17 + 1 = 18th
1801 - 1 = 1800 => remove last two substring = 18 => 18 + 1 = 19th

---
### Examples/Tests
```ruby
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
```
---
### Data Structures
Array.

---
### Algorithm
**century**
- START

- SET `year` = input - `1`
- SET `year` to a string
- SET `year` to an array of substrings
- DELETE the last two elements
- JOIN `year` array as a string
- SET `year` to an integer
- SET `year` += `1`
- SET `year` to string

- READ `year`
  - IF `('11'..'13')` includes `year`
    - THEN concat with `'th'`
  - IF `year` ends in `1`
    - THEN concat with `'st'`
- IF `year` ends in `2`
    - THEN concat with `'nd'`
- IF `year` ends in `3`
    - THEN concat with `'rd'`
- ELSE
    - THEN concat with `'th'`

- END

---
### Code
*see `02_century.rb`*
