## Breakfast, Lunch, or Dinner? (Part 3)
#### What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def meal
  return 'Breakfast'
  'Dinner'
end

puts meal
```
___
#### Solution
`Breakfast`

`#meal` will return `'Breakfast'` because `return` will stop its block of code after it returns its argument, which is `'Breakfast'`.  This means `'Dinner'` is never evaluated.
___
#### Solution, LS
`Breakfast`
#### Discussion
Based on the knowledge that `return` exits the method, you should be able to determine that the `return` value is `"Breakfast"`. Even though `"Dinner"` is the last line, when `return` is executed, it tells the method to end, which means anything after that line won't be processed.
___
#### Notes
