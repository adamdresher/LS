## Breakfast, Lunch, or Dinner? (Part 6)
#### What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal
```
___
#### Solution
`Breakfast`

`return` exits the method after evaluating its argument, `Breakfast`.  So it passes `Breakfast` to `#puts`.  This means the rest of `#meal`'s block is ignored.  `#puts` will output `#meal`'s value, `Breakfast`, and return `nil`.
___
#### Solution, LS
`Breakfast`
#### Discussion
After completing parts 1-5, determining the return value of `meal` should be straightforward. The first thing you should notice is the `return` keyword on the first line of the method. Based on what we've learned so far, we know that `return` immediately exits the method and returns the provided value. Knowing this, we can confidently say that the return value of meal will be `"Breakfast"`. `return` will be executed upon the invocation of `meal`, which means `meal` will immediately end and return the value provided by `return`.
___
#### Notes
