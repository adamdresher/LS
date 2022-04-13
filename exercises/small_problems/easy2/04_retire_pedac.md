### Understanding the Problem
Build a program that displays when the user will retire and how many years she has to work till retirement.

**Explicit Requirements:**

- Input: Two user input integers, one for `age` and another for `retire`.
- Output: Two strings, one states the retirement year and another states how many more years to work.

**Implicit requirements:**

- Is this based on 2016?
    - The example uses 2016, but it would be best to use the current year.

**Mental Model:**

- Create a method that asks for two inputs: user's age and user's retirement_age.
- Determine the current_year, then subtract age from current_year to determine year_born.
- Add retirement_age to year_born to determine retirement_year.
- Subtract current_year from retirement_year to determine years_to_work.
- Finally, output strings to state current_year, retirement_year, and years_to_work.

---
### Examples/Tests
```ruby
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
```
---
### Data Structures
None.

---
### Algorithm
Algorithm 1:
- START
- SET current_year
- GET user's age
  - SET input = `age`
- GET user's retirement age
  - SET input = `retirement_age`
- SET year_born = current_year - age
- SET retirement_year = year_born + retirement_age
- SET countdown = retirement_year - current_year
- PRINT strings with current_year, retirement_year, and years_to_work

---
### Code
*see `04_retire.rb`*
