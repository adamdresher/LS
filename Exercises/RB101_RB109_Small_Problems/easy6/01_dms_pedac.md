### Understanding the Problem
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds.

**Explicit Requirements:**

- Input: A float point number.
- Mutate/Output/Return: A string.
- Solution results may vary, but they should be within ~(1..2) seconds of test cases.
- Minutes and seconds should be formatted with leading zeroes.
- Degrees should be followed by the degree symbol, `°`, using the given CONSTANT, `DEGREE`.
- Minutes should be followed by the min symbol, `'`.
- Seconds should be followed by the sec symbol, `"`.
- Degree == 60 minutes
- Minute == 60 seconds

**Implicit requirements:**

- - What is the relationship between degrees, minutes, and seconds?
    - They are are units of measuring the size of an angle.  Minutes and seconds are partitions of degrees.  (Radians are another way of measuring an angle).
- What is the mathmatical relationship between degrees, minutes, and seconds?
    - 1 degree == 60 minutes == 3600 seconds
    - 1 minute == 60 seconds
- What is the return string's formatting logic?
    - `(76.73) == %(76°43'48")`
    - 76° + 0.73 degrees
    - 0.73 * 60 == 43.8
    - 76°43' + 0.8 * 60 == 48.0
    - 76°43'48"

    - `(30) == %(30°00'00")`
    - 30°00'00" # no decimal means no minutes or seconds

    - (254.6) == %(254°36'00")
    - 254° + 0.6 degrees
    - 0.6 * 60 == 36.0
    - 254°36'00"

    - (93.034773) == %(93°02'05")
    - 93° + .034773 degrees
    - 0.034773 * 60 == 2.08638
    - 93°02' + 0.08638 * 60 == 5.1828
    - 93°02'05"

    - (0) == %(0°00'00")
    - 0°00'00" # zero returns zero

    - (360) == %(360°00'00") || dms(360) == %(0°00'00")
    - 0°00'00" or 360°00'00" # 360 can return either
- How are `0` degrees handled?
    - `0°00'00"`
- How are `360` degrees handled?
    - `360°00'00"` or `0°00'00"`
- Are degrees formatted with leading zeroes?
    - The test cases imply no.
- What does the `%` in test case returns mean?
    - A string object is returned when the percentage character is followed by parentheses, `%()`.

**Mental Model:**

- Start by setting a CONSTANT for the string character, `°`.  
Next define a helper method that takes a float point number argument and integer argument.  Divide the float argument by the integer argument and return an array with the quotient and the remainder.
Next define a method that takes a float point number argument.  Pass the argument to the helper method and `1`.  Set the return value to two variables: the quotient is set to `num_degree`, the remainder is set to `num_min`.  Pass `num_min` to the helper method and `60`.   Set the return value to two variables: the quotient is set to `num_min`, the remainder is set to `num_sec`.  Round `num_sec` to the nearest whole integer.
Return a string with `num_degree` + `°` + `num_min` + `'` + `num_sec` + `"`

---
### Examples/Tests
```ruby
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
```
---
### Data Structures
None.

---
### Algorithm
- Set a CONSTANT: DEGREE = "\xC2\xB0"

**dms**
- define a method that takes a float point number argument
- determine the remainder of argument based on a 360 cycle of degrees in a circle
- pass the remainder to the helper method
  - set the return value to two variables:
    - quotient set to `degrees`, remainder set to `minutes`
- `minutes` times 60
- pass `minutes` to the helper method
  - set the return value to two variables:
    - quotient set to `minutes`, remainder set to `seconds`
- if rounding `seconds` to the nearest whole integer increases the number
  - add `1` to `minutes`
  - set `seconds` to `0`
- return a string: `degrees` + `°` + `minutes` + `'` + `seconds` + `"`

**split_angle**
- define a helper method that takes a float point number argument
- divide the float argument by 1
  - return an array of two elements: quotient, remainder

---
### Code
*see `01_dms.rb`*
