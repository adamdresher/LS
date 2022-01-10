## One Isn't Enough
#### Using the code below, select `'dog'` from `pets`, add the return value to `my_pets`, then print the value of `my_pets`.
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
```
Expected output:

`I have a pet fish and a pet dog!`
___
#### Solution
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop

my_pets << pets[1]

if my_pets.size == 1
  puts "I have a pet #{my_pets.first}!"
else
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"
end
```
___
#### Solution, LS
```ruby
my_pets.push(pets[1])

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"
```
#### Discussion
In the previous exercise, we learned how to remove an element from an array. Here we do the opposite and add an element to an array using `#push`. When using `#push`, you pass in the element you want to add and it will be added to the end of the specified array. In this case, we selected `'dog'` from `pets` and added it to `my_pets`.

Note that `my_pets` is still an array. Therefore, when we print `my_pets` we have to select the index of each element, `'fish'` and `'dog'`.
___
#### Notes
