## Breakfast, Lunch, or Dinner? (Part 2)
#### What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def meal
  'Evening'
end

puts meal
```
___
#### Solution
`Evening`

The method will return `'Evening'` because it is the last expression evaluated.  However due to `#puts`, the code will output `Evening` and return nil.
___
#### Solution, LS
`Evening`
#### Discussion
The last exercise explained how a method's return value is determined. Therefore, we can tell that the `return` value of `meal` will be `"Evening"` because it's the only line in the method.
___
#### Notes
