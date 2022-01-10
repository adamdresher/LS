## Breakfast, Lunch, or Dinner? (Part 5)
#### What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def meal
  'Dinner'
  puts 'Dinner'
end

p meal
```
___
#### Solution
```
Dinner
nil
```
`#meal` will output `Dinner` and return `nil`.  However `#meal` is passed to `#p`.  `#p` will inspect the last return value, then output and return its value, will is `nil`.  So `p meal` will first output `#puts`, `Dinner` then output the return value of `#meal`, `nil`.
___
#### Solution, LS
```
Dinner
nil
```
#### Discussion
When looking at this method, we know that the last line is `puts 'Dinner'`, therefore, the return value of `meal` is the evaluated result of that line. Based on the previous exercise, we know that the return value of `#puts` is always `nil`. Putting both of those together results in the return value of `meal` being `nil`.

However, two values are printed, not just `nil`. This is because there is a `#puts` and a `#p` (we use `#p` so that `nil` is visible in the output).
___
#### Notes
If `puts meal` was used, the output would be ` ` because `nil` outputs as a blank.