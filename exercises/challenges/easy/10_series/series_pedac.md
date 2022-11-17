#### Problem
Goal: Create a program that takes 2 arguments (a string of digits & length), then returns all possible consecutive number series in the string.
Input: String of Integers, Integer (legnth)
Return: Array of nested Arrays (each nested Array contains a subset)
Rules:
- return Array contains only numbers that are subsets of list argument
- subsets' length is based on length argument
- raise error if length argument is larger than list argument
- subsets are consecutive numbers of list argument
- each subset is a list of sequential digits from the list argument
- subsets are returned in the order found

#### Examples
"01234", 3
- 012
- 123
- 234

"01234", 4
- 0123
- 1234

#### Data Structures
- list to record subsets (Array)


#### Algorithm
- `Series` class
  - `#initialize(str)`
    - accepts a String of Integers
  - `#slices(length)`
    - raises `ArgumentError` if `length` is longer than `str`
    - initialize an empty collection (Array)
    - subtract `length` from `str` and save difference
    - iterate over numbers `0..-difference`
      - create a subset string of `str` starting at current number's index and use the difference as the subset's length.
      - split the subset into digits
        - chars.map(&:to_i)
      - add the list of digits to the series collection
