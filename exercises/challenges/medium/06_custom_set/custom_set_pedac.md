# Problem
goal: Define a custom data structure that can manipulate its elements in multiple ways.
input:
output:
rules:
- all elements of a set are numbers
- sets do not store duplicate elements
  - only retains unique elements
  - if duplicate element is added, original element is removed?
    - test_eql_duplicate_elements_do_not_matter
- custom sets are initialized with no arguments or Array arguments

- `CustomSet` class
  - `#initialize(arr)`
    - if argument is an Array, its elements are used as elements for self
  - `#empty?`
    - returns boolean whether self contains any elements
  - `#contains?(obj)`
    - returns boolean whether or not argument exists in self
  - `#subset?(other_set)`
    - returns boolean whether argument contains **all** elements of self
      - true if both either self or argument are empty
      - subset must be found in the same order ???
  - `#disjoint?(other_set)`
    - returns boolean whether argument contains **none** of the elements of self
      - true if both either self or argument are empty
  - `#eql?`
    - returns boolean whether argument and self contain the same elements
    - order insensitive
  - `#add(obj)`
    - adds argument to self
    - returns self
  - `#intersection(other_set)`
    - returns a custom set with the shared elements between self and argument
    - returns an empty set of no shared elements
    - order insensitive
  - `#difference(other_set)`
    - returns a custom set with argument's elements removed from self
      - element is ignored if self doesn't contain it
    - returns an empty custom set if self is empty
  - `#union(obj)`
    - returns a custom set with elements of self and argument combined

# Example


# Data Structure
sorted array of unique elements

# Algorithm
