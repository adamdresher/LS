## Greet Your Friends
#### Your friends just showed up! Given the following array of names, use a `for` loop to greet each friend individually.
`friends = ['Sarah', 'John', 'Hannah', 'Dave']`

Expected output:
```
Hello, Sarah!
Hello, John!
Hello, Hannah!
Hello, Dave!
```
___
#### Solution
```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for f in friends
  puts "Hello, #{f}!"
end
```
___
#### Solution, LS
Same, :sunglasses:.
#### Discussion
The `for` loop is useful for looping over a set number of elements. Using `for` allows us to easily do something with each element in the given array. In this case, we want to output each name along with a greeting. We can do this by using the `friend` variable which represents the current element. We simply need to output our greeting and `friend`.

When naming variables in a `for` loop it's typical to use the standard format: `for friend in friends`, `for cat in cats`, etc. This makes it clear that we're iterating over `friends` and doing something with each `friend`.
___
#### Notes
