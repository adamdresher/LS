## Sleep Alert
#### In the code below, `status` is randomly assigned as `'awake'` or `'tired'`.
```ruby
status = ['awake', 'tired'].sample
```
Write an `if` statement that returns `"Be productive!"` if `status` equals `'awake'` and returns `"Go to sleep!"` otherwise. Then, assign the return value of the `if` statement to a variable and print that variable.
___
#### Solution
```ruby
status = ['awake', 'tired'].sample

alert = if status == 'awake'
  'Be productive!'
else
  'Go to sleep!'
end

puts alert
```
___
#### Solution, LS
```ruby
alert = if status == 'awake'
          'Be productive!'
        else
          'Go to sleep!'
        end

puts alert
```
#### Discussion
So far, we've been using `if` statements to print strings directly within the clauses. In this exercise, we aren't printing the string immediately, instead, we're returning the string to be printed at a later time. We can do this quite easily by saving the return value of the `if` statement to a variable.

If you think about this, a lot of time and space can be saved by structuring your code this way. Instead of repeating `#puts` twice, or many times, you only have to invoke it once.
___
#### Notes
LS does a nice thing about indenting the block to make it more readable.
