## Breakfast, Lunch, or Dinner? (Part 4)
#### What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal
```
___
#### Solution
```
Dinner
Breakfast
```
`#meal` will output `Dinner`, then `Breakfast`, and return `nil` as a value.  This is because the `#puts` within `#meal` is first evaluated and thus outputs its argument.  Then the return value, `Breakfast` is passed to `#puts`, so `Breakfast` is output.  However because `#puts` always returns `nil`, `nil` is the ending value.
___
#### Solution, LS
```
Dinner
Breakfast
```
#### Discussion
When you use `#puts` it's important to know that the printed value and the return value are not the same. `#puts` outputs the value it's given and returns nil. Therefore, the return value of puts `'Dinner'` is `nil`. However, that's not the return value of `meal`. The return value of `meal` is `'Breakfast'` because of the explicit return.

If the return value is `'Breakfast'` then why are both `"Dinner"` and `"Breakfast"` printed? The answer is simple: there are two `#puts` which means there will be more than one value printed.
___
#### Notes
