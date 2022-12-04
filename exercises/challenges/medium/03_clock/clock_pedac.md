#### Problem
Goal: Create a clock that is independent of date.
Input: -
Return: -
Rules:
- create a clock object
- clocks have the ability to add and/or subtract minutes
  - adding/subtracting minutes returns a new clock object
- clock objects can be compared
  - their time is used for comparison
- no built-in date or time functionality can be used

- `Clock` class
  - clock objects do not need to change time automatically (as time does)
  - clock objects do not have a default time
  - `::at(hour, minutes)`
    - returns a new `Clock` object with the arguments used to set the time
    - minutes are an optional argument with a default value of `00`
  - `#to_s`
    - converts a `Clock` object to a `String` representation of the clock's time
    - time is displayed in a `'24:00'` format
    - this means `'5am'` is returned as `'05:00'`
  - `#+(minutes)`
    - returns a new `Clock` object with the argument added to the new time
    - if 60 or more seconds are passed in, the hour is adjusted
  - `#-(minutes)`
    - similar implementation to `#+()`
  - `#<=>(other)`
    - compares each clock's time

#### Examples

`Clock.at(8).to_s == '08:00'`
`Clock.at(10) + 3 == '10:03'`
`Clock.at(0) - 50 == '23:10'`
`Clock.at(10, 30) - 5 == '10:25'`
`Clock.at(10) + 3061 == '13:01'`

add minutes results in add hour
add minutes results in minutes starting at 0
add minutes results in hour starting at 0
minus minutes results in minus hour
minus minutes results in minutes moving back to 60
minus minutes results in hour moving back to 23

#### Data Structure

instance variable to store object's time

#### Algorithm
- `Clock` class
  - set `HRS_IN_DAY` to 24
  - set `MIN_IN_HR` to 60
  - set `MIN_IN_DAY` to 1440

  - `::at(hour, minutes)`
    - initialize new `Clock` object
    - minutes have a default value of `0`

  - `#initialize(hour, minutes)`
    - initialize instance variables for hour and minutes using arguments' values
    - should be private

  - `#to_s`
    - return a string of hours and minutes
    - format as `'HH:MM'`

  - `#+(minutes)`
    - split minutes into less than a day's worth of hours and days
    - add additional hours to hour
      - if hour is greater than 24
        - subtract 24 from hour
    - add additional minutes to minutes
    - if minutes is greater than 60
      - subtract 60 from minutes
      - add 1 to hour

  - `#-(minutes)`
    - split minutes into less than a day's worth of hours and days
    - subtract additional hours from hour
      - if hour is less than 0
        - add 24 to hour
    - subtract remainder from minutes
    - if minutes is less than 0
      - add 60 to minutes
      - subtract 1 from hour

    - `#hrs_and_min(minutes)
    - remove whole days of minutes
      - divmod
      - last
    - split minutes into additional hours and additional minutes
      - divmod

  - `#<=>(other)`
    - convert self and other `#to_s`
    - compare self and other
