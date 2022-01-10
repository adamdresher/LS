## More Than One
#### In the code below, an array containing different types of pets is assigned to `pets`.
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
```
Write some code that selects `'fish'` and `'lizard'` from the `pets` array - select the two items at the same time. Assign the return value to a variable named `my_pets`, then print the contents of `my_pets` as a single string, e.g.:

`I have a pet fish and a pet lizard!`

Make sure you use `my_pets` to get the words `"fish"` and `"lizard"` in that message.
___
#### Solution
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets[2, 2]
puts "I have a pet #{my_pets[0]} and a pet #{my_pet[1]}!"
```
___
#### Solution, LS
```ruby
my_pets = pets[2..3]

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"
```
#### Discussion
Selecting a specific element from an array is fairly simple. But what about selecting more than one element at the same time? Think about how counting numbers works for a moment. Typically, you'll count from the lowest number to the highest. What about counting only certain numbers like 1 through 5?

In Ruby, this is called a range of numbers. `1..5` is the same as `1` through `5`. We can apply this concept to select multiple elements from an array. Instead of just using a single number, `pets[2]`, we can use a range of numbers to select both `'fish'` and `'lizard'`, like this` pets[2..3]`. Note that when you print `my_pets`, you'll need to use `[0]` and `[1]` because it will be in the form of an array, not a string.
___
#### Notes
`#[]` is an array method.  So it can sometimes be less obvious when something is a method.
