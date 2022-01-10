## Favorite Number(Part 1)
#### The following array contains three names and numbers. Group each name with the number following it by placing the pair in their own array. Then create a nested array containing all three groups. What does this look like? (You don't need to write any code here. Just alter the value shown so it meets the exercise requirements.)
```ruby
['Dave', 7, 'Miranda', 3, 'Jason', 11]
```
___
#### Solution
```ruby
# SOLUTION 1.
[['Dave', 7], ['Miranda', 3], ['Jason', 11]]


# SOLUTION 2.  USING METHODS.
names = ['Dave', 7, 'Miranda', 3, 'Jason', 11]

first_name = []
second_name = []
third_name = []

2.times do
  first_name << names.shift
end
2.times do
  second_name << names.shift
end
2.times do
  third_name << names.shift
end

names.push(first_name, second_name, third_name)
p names
```
___
#### Solution, LS
```ruby
[['Dave', 7], ['Miranda', 3], ['Jason', 11]]
```
#### Discussion
Arrays are useful for many reasons but one of the great things about them is their ability to hold any object. This includes other arrays. Our solution takes each name and pairs it with the appropriate number by placing each group in its own array. We do this for all three of the names and numbers, then we simply place the newly created arrays into a new array. Thus, creating a nested array.
___
#### Notes
How do you access elements within the nested array?

`Array#[][]`

I know this already, but why is that acceptable syntax?  It's because `[]` is actually an array method.  The first `[]` is called by `Array` and uses its array value.  The second `[]` uses the return value of the first `[]`, which is the nested array.

Neat!
