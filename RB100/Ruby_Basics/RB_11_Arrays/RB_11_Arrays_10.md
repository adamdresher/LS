## Are We The Same?
#### In the code below, two arrays containing several numbers are assigned to two variables, `array1` and `array2`.
```ruby
array1 = [1, 5, 9]
array2 = [1, 9, 5]
```
Compare `array1` and `array2` and print `true` or `false` based on whether they match.
___
#### Solution
```ruby
# SOLUTION 1.  USING `==`
p array1 == array2 => false

# SOLUTION 2.  USING `#eql?`
p array1.eql?(array2) => false

# SOLUTION 3.  CHECK FOR MATCHES OUT OF ORDER.  USING `#select` TO SELECT EACH ELEMENT, AND `#any?` TO COMPARE ELEMENTS OUT OF ORDER.
array1.select { |n| array2.any?(n) }.any?

# SOLUTION 4.  CHECK FOR MATCHES OUT OF ORDER.  USING `#combination` TO CREATE POSSIBLE ELEMENT COMBINATIONS, `#include?` TO EVALUATE IF THERE ARE OTHER MATCHES AND `#any?` TO RETURN IF THERE ARE MATCHES.
array1.combination(1) { |n| array2.include? n }.any?
```
___
#### Solution, LS
```ruby
puts array1 == array2
```
#### Discussion
There's more than one way to compare arrays but perhaps the simplest way is using `==`. In the solution, we use `==` to compare the value of `array1` to the value of `array2` and print the return value, which is `false`, with `#puts`.

Note that `==` treats two `Array`s as equal if they contain the same number of elements, and each element in one `Array` is equal to the corresponding element in the second `Array`.
___
#### Notes
Arrays are compared as a single object.  This means the order of elements makes a difference.
