=begin
Understanding the **Problem**:
- Write a method that counts the number of occurrences of each element in a given array.

Questions/Answers:
- What is the input?
    - An array of strings.
- What is the output?
    - Print a list of elements with the number of occurrences within the input array
- Are the input elements always strings?
    - Yes.
- Is the method case-sensitive?
    - Yes.
- Does the method care about duplicates?
    - Yes, that's the nature of this method.
- Should it mutate the input?
    - Undetermined.  To be safe, it should avoid mutating.
- Does the order which the elements are printed matter?
    - Yes.  Printed as they are listed from left to right.

Mental Model:
- Create a method that accepts an array of strings as its argument.  Then list out all the unique elements within the array along with the number of their occurrences within said array.

- Create a method that accepts an array of strings as its argument.  

**Examples/Tests**:
```ruby
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
```
**Data Structures**:
- Array

**Algorithm**:
- Algorithm 1:
  - Create an method called `count_occurrences` with one parameter, `list`.
  - Find all the unique elements within the array and assign them as hash keys to a new hash.
  - For each hash key, iterate through the array and count the number of occurrences.  Assign that number as the key's value.
  - Output each hash key and value.

- Algorithm 2:
  - Create an method called `count_occurrences` with one parameter, `list`.
  - Find all the unique elements with the array and assign them to a new array called, `output`.
  - Count how many occurrences of each element in `output` there are in `list`.
  - Create a new subarray from element and the element count.
  - Print each nested array of `output` to show the unique element and count- respectively the first and second elements.

**Code**:
=end
# Algorithm 1

# Algorithm 2
def count_occurrences(list)
  output = list.uniq
  output.map! { |element| [element, list.count(element)] }
  output.each { |element| puts "#{element[0]} => #{element[1]}" }
end
