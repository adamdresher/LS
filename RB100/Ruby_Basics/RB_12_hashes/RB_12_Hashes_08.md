## Low or Nothing
#### In the following code, `numbers` isn't mutated because `#select` isn't a destructive method. However, there is a destructive version of `#select` named `#select!`. Modify the code to use `#select!` instead of `#select`.
```ruby
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select do |key, value|
                 value < 25
               end

p low_numbers
p numbers
```
Expected output:
```
{low: 10}
{low: 10}
```
___
#### Solution
```ruby
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value|
                 value < 25
               end

p low_numbers
p numbers
```
___
#### Solution, LS
```ruby
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value|
                 value < 25
               end

p low_numbers
p numbers
```
#### Discussion
In the previous exercise, we used `#select` without the bang suffix (`!`). This returned a new hash from `#select`, and left `numbers` unmodified. Our solution in this exercise uses `#select!` to modify the hash assigned to `numbers`.
#### Further Exploration
In our solution, we assign the return value of `#select!` to `low_numbers`. Is this assignment really needed if we mutated `numbers`? Typically, when using methods that mutate the caller, the return value is of no interest because the caller is intentionally being mutated. If you do an assignment like this, you end up creating an alias: both `numbers` and `low_numbers` now point to the same `Hash`.
___
#### Notes
