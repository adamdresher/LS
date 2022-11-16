#### Problem
Goal: Create a program that can generate lyrics for the 99 Bottles of Beer song.
Input: Integer/s (second argument is optional) or none
Return: String
Rules:
- format of the song's chorus is:
  - "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n"
- if the number is 1, 'bottles' should be formatted to 'bottle'
- if the number is 0, 'bottles' should be formatted to 'no more bottles'
  - second line of chorus becomes:
    - "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
- if two numbers are given, they define a range of verses
  - first number should be larger, ex. `99, 97 == [99, 98, 97]`
- if no arguments are given, the entire song should be returned
  - default range of `99, 0`

#### Examples
99 => "#{99} bottles of beer on the wall, #{99} bottles of beer.\n" \
    "Take one down and pass it around, #{99-1} bottles of beer on the wall.\n"

1  => "#{1} bottle of beer on the wall, #{1} bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"

0  => "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

0 => num = 'no more' or 'it'
99-2 && 0 => "#{num} bottle#{plural}"
1 => "#{num} bottle#{singular}"

line1
  - 99, 2: normal, plural
  - 1:     normal, singular "1 bottle" ...
  - 0:     uniq,   plural   "No more bottles" ...
line2
  - 99, 3: normal, plural
    2:     normal, singular ... "1 bottle" ...
  - 1:     uniq,   plural   "Take it down" ... "no more bottles" ...
  - 0:     uniq,   plural   "Go to the store and buy some more" ... "99 bottles" ...


#### Data Structures
- list of templated chorus
  - first line of chorus is the same for all verses
  - second line is unique for verses 1 and 0

#### Algorithm
- `BeerSong` class
  - create chorus dictionary (Hash with 2 procs)
    - each proc defines a line of the chorus
      - the lines references numbers outside of the closure
      - second line has 3 scenarios based on current number [0, 1, 2+]
  - `::verse`
    - takes one num, Integer
    - create instance variables that can be accessed by procs
      - current number
      - starting quantity is plural or singular
      - ending quantity is plural or singular
    - add first line to return string
      - modify num of bottles based on num
    - add second line based on num to return string
      - num is 0, 1, or 2+
      - modify num of bottles if num is 2+

  - `::verses`
    - takes two nums, Integers
    - create a range of numbers from second_num to first_num and iterate backwards
      - pass each num to `::verse`
      - join each verse with a new line

  - `::lyrics`
    - takes no nums
    - call `::verses` with 99 and 0 as nums

  - check if num is plural
    - format 'bottles' in line
