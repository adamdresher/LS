## New Pet
#### In the code below, an array containing different types of pets is assigned to pets.
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
```
Select `'fish'` from `pets`, assign the return value to a variable named `my_pet`, then print the value of `my_pet`.

Expected output:

`I have a pet fish!`
___
#### Solution
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']

my_pet = pets[2]
puts "I have a pet #{my_pet}!"
```
___
#### Solution, LS
```ruby
my_pet = pets[2]

puts "I have a pet #{my_pet}!"
```
#### Discussion
When deciding how to select a specific element from an array, it's important to first know how arrays work. Every array has its own index where each element is numbered. Counting the indexes is just like counting normally, except instead of starting at 1, you start counting at 0. Consider the following example:

```ruby
['cat', 'dog', 'fish', 'lizard']
 0      1      2       3
 ```
To select a specific element, like `'fish'`, all we need to know is the index number that corresponds with the element. Therefore, we can simply write `pets[2]` to return `'fish'`. All that's left to do now is save it to a variable named `my_pets` and print `"I have a pet #{my_pet}!"`.
___
#### Notes
