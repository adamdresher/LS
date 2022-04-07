### Understanding the Problem
Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

**Explicit Requirements:**

- Input: An integer.
- Return: A string.

**Implicit requirements:**

- Can more than a day's amount of minutes (1440) be accepted?
    - Yes.

**Mental Model:**

- Create a method that accepts an integer as an argument.  Check if it's positive/negative and save the result.  Next, remove the negative sign (`-`) if its there.  Divide the integer by `60` (minutes in hour), save the quotient (`hrs`) and remainder (`min`).  If the sign is positive, format `hr` and `min` as a timestamped string and return the value.  If the sign is negative, `hrs` is equal to `24` minus `hrs`, `min` is equal to `60` minus `min` unless `min` is `0`.

---
### Examples/Tests
```ruby
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
```
---
### Data Structures
None.

---
### Algorithm
**time_of_day**
- Accept one argument: time (integer).
- Check if the argument is positive or negative.
  - If argument is negative,
    - Then remove negative sign and save for later.
- Divide the argument by 60 to find the number of hours.
  - The remainder is the number of minutes.
- If the sign is positive,
  - Then run format_time with hours and minutes.
  - Return output.
- If the sign is negative,
  - Then run inverse_time with hours and minutes.
  - Then run format_time with hours and minutes.
  - Return output.

**inverse_time**
- Accept two arguments: hours, minutes (integers).
- Unless minutes are 0, subtract minutes from 60, then add 1 to hours.
- Unless hours are 0 or 24, subtract hours from 24.
- Return hours and minutes.

**format_time**
- Accept two arguments: hours, minutes (integers).
- Format hours and minutes to be two character long strings.
  - If an argument is 1 character, prepend it with `0`.
- Return hours and minutes with semicolon: `'00:00'`.

---
### Code
*see `02_time_of_day.rb`*
