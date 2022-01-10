## Free Lizard
#### In the code below, an array containing different types of pets is assigned to pets. Also, the return value of `pets[2..3]`, which is `['fish', 'lizard']`, is assigned to `my_pets`.
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
```
Remove `'lizard'` from `my_pets` then print the value of `my_pets`.

Expected output:

`I have a pet fish!`
___
#### Solution
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets[2..3]
my_pets.pop

if my_pets.size == 1
  puts "I have a pet #{my_pets.first}!"
else
  puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"
end
```
___
#### Solution, LS
```ruby
my_pets.pop

puts "I have a pet #{my_pets[0]}!"
```
#### Discussion
Knowing how to modify a data structure, like an array, is crucial to using them in your programs. In our solution, we use `#pop` to remove the last element from `my_pets`. We're able to use this method because `'lizard'` is the last element. If it wasn't, we'd have to remove it some other way.

The key thing to note here when printing `my_pets` is that `my_pets` is still an array. It looks like this: `['fish']`. Just because it only has one element doesn't mean it somehow converted to a string. Arrays can contain any number of elements, even none.
___
#### Notes
