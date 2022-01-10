## Doubled
#### In the code below, an array containing the numbers 1 through 5 is assigned to numbers.
```ruby
numbers = [1, 2, 3, 4, 5]
```
Use `Array#map` to iterate over numbers and return a new array with each number doubled. Assign the returned array to a variable named `doubled_numbers` and print its value using `#p`.

Expected output:

`[2, 4, 6, 8, 10]`
___
#### Solution
```ruby
numbers = [1, 2, 3, 4, 5]

doubled_numbers = numbers.map { |n| n * 2 }
p doubled_numbers
```
___
#### Solution, LS
```ruby
doubled_numbers = numbers.map do |number|
                    number * 2
                  end

p doubled_numbers
```
#### Discussion
Using iterators is key to properly controlling data structures like arrays. In the previous exercise, we used `Array#each` to iterate over an array and print each element. In this exercise, we use `Array#map` which iterates over an array and returns a new array with each element transformed based on the block's return value. This means we can assign the return value of `#map` to a variable to use at a later time.

The important thing to note here is how `#map` decides what value to place in the new array. Looking at the solution, we can see that the only statement within the block is `number * 2`. Therefore, the return value of this statement will be the block's return value. As stated earlier, we know that `#map` uses the return value of the block as the new element's value. This means that each element in the new array is the return value of the block at each iteration.
___
#### Notes
