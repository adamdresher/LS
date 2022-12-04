# Problem
goal: Create a simple linked list data structure with LIFO functionality (Last In, First Out).
input:
output/return:
rules:
- list uses LIFO
- elements 
- ability to reverse the linked list
- ability to convert to Array object
- ability to be converted from Array object

- contains `Element` class
  - `#initialize` takes one or more arguments
    - arguments can be Integer or other Element objects
  - `#datum`
  - `#tail?`
  - `#next`
- contains `SimpleLinkedList` class
  - `::from_a(array)`
  - `#size`
  - `#empty?`
  - `#push(element)`
  - `#head`
  - `#peek`
  - `#pop`
  - `#to_a`

# Example


# Data Structure


# Algorithm
- `Element` class
  - `#initialize(*element)`
    - takes one or more arguments (Integer, other Element objects)
    - first argument is self's value
    - second argument is next element
  - `#datum`
    - returns self's value
  - `#tail?`
    - returns Boolean whether self contains a value?
  - `#next`
    - returns `nil` if self contains only one value
    - returns next element after self

- `SimpleLinkedList`
  - `#size`
    - returns 0 if self contains no elements
    - returns number of elements within self
  - `#empty?`
    - returns Boolean whether self contains elements
  - `#push(value)`
    - accepts one argument
    - instantiates a new `Element` with two arguments
      - value, last element in self
    - adds `Element` to end of self
  - `#head`
    - returns last element in self
  - `#peek`
    - returns nil if self contains no elements
    - returns last element's value?
  - `#pop`
    - removes last element from self
  - `#to_a`
    - converts self to an Array object containing elements values
    - reverse Array

  - `::from_a(array)`
    - converts argument into a new `SimpleLinkedList`
      - adds elements from argument in reverse order
    - nil and empty Arrays are converted into objects with zero elements
