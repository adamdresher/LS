#### Problem
Goal: Create meetup objects that takes a month and year, then can detemine the day of the month using the day of the week and a descriptor.
Input: month, year, day of the week, descriptor
Output/Return: day of the month
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

- `Meetup` class
  - `#initialize(year, month)`
    - returns a `Meetup` object
  - `#day(day_of_wk, descriptor)`
    - returns a `Date` object

#### Example
`Meetup.new(2013, 3).day('Monday', 'first') == Date.civil(2013, 3, 4)`

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
