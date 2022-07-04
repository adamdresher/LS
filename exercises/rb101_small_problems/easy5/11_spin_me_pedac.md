### Understanding the Problem
Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?
```ruby
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
```
**Explicit Requirements:**

- Input: A string.
- Return: A string.

**Implicit requirements:**

- Is the method mutating self or creating a copy?
    - That's the question.

**Mental Model:**

- `spin_me` takes a string argument and returns a string that contains the same words, but with each word's characters reversed.

---
### Examples/Tests
```ruby
spin_me("hello world") # "olleh dlrow"
```
---
### Data Structures
Array.

---
### Algorithm
**spin_me**
- takes a string argument
- split  the argument into an array of substrings using `' '` as a delimiter
- iterate through the array's elements:
  - mutate the element by reversing the order of element's substrings
- combine array's elements using `' '`
- return a new string

---
### Answer
`spin_me` returns a new `String` object with the order of each word's characters reversed.  This may be misleading at first glance as `#each` is invoked with a mutating block.  However `#each` is actually called on by a new `Array` object via `#split`.  `#join` also returns a new `String` object.
The method definition starts by splitting the string argument into an array of substrings by using `String#split` which has a default delimiter of `' '`.  This means a new `Array` object is returned and passed to `Array#each`.  `#each`'s block invokes `String#reverse!` on the array's elements.  Although `#each` returns self, its block has mutated the array.  The next chained method, `Array#join`, modifies the modified array to return a new `String` object with expected results.
The original `String` object is still accessible as it isn't mutated, however it isn't the method's return value.
