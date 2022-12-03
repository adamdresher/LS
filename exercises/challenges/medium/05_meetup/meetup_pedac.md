#### Problem
Goal: Create meetup objects with month and year values, and the ability to detemine the day of the month using the day of the week and a descriptor.
Input: month, year, day of the week, descriptor
Output/Return: exact date (`Date` object)
Rules:
- months are given as a number (1-12)
- years are given as a number (ex., 2021)
- days of the week are given as strings:
  - 'Monday', 'Tuesday', etc.
  - case insensitive
- descriptors are given as strings:
  - 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'
  - case insensitive
  - 'teenth' represents a day between 13-19
- return nil if day doesn't exist

- `Meetup` class
  - `#initialize(year, month)`
    - returns a `Meetup` object
  - `#day(day_of_wk, descriptor)`
    - returns a `Date` object

#### Example
`Meetup.new(2013, 3).day('Monday', 'first') == Date.civil(2013, 3, 4)`

year = 2013
month = 3
day = 1-7, first Monday

#### Data Structure
hash with descriptors as keys and potential days of the month as values
- {
   first: (1..7).to_a,
   second: (8..14).to_a,
   ...,
   teenth: (13..19).to_a,
   last: (month.size-7..month.size).to_a
   }

#### Algorithm
- `Meetup` class
  - initialize a `WEEKDAY_NUM` dictionary constant to convert weekday name to weekday number
  - `#initialize(YYYY, M)`
    - instantiate a `year` var:          `YYYY` (4 digits)
    - instantiate a `month` var:         `M` (1 integer)
    - instantiate a `days_in_month` var: `Date.new(YYYY, M, -1).day`
  - `#day(day_of_week, descriptor)`
    - case descriptor
    - when 'first'
      - `days_of_month = (1..7).to_a`
      - find day of the month using `days_of_month`
    - when 'second'
      - `days = (8..14).to_a`
      - find day of the month using `days_of_month`
    - when 'third'
      ...
    - when 'fourth'
      ...
    - when 'teenth'
      - `days = (13..19).to_a`
    - when 'last'
      - first_day = days_in_month - 6
      - `days = (first_day...days_in_month).to_a`


  - helper: day_of_month(days_of_month, day_of_week)
    - iterate over days of month
      - create `Date` object using current_day
        - `Date.new(year, month, current_day)`
      - determine current_day_of_week
      - return `Date` object if current_day == day_of_week
    - return nil if no match found