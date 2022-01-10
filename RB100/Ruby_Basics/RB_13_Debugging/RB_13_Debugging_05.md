## Even Numbers
#### We want to iterate through the `numbers` array and return a new array containing only the even numbers. However, our code isn't producing the expected output. Why not? How can we change it to produce the expected result?
```ruby
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]
```
___
#### Solution
The wrong method is being applied.  `#map` returns the value evaluated by its block.  In other words, `#map` transforms/modifies its caller's elements.  In this case, it returns `nil` on some iterations.  Using `#select` will select only the original elements that evaluate as true within its block.  This means no `nil` values.
```ruby
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n if n.even?
end

p even_numbers
```
___
#### Solution, LS
```ruby
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n.even?
end

p even_numbers #=> [2, 6, 8]
```
#### Discussion
More appropriate for our use case is `Array#select`, which is used for selection and returns a new array containing only the elements of the original array for which the return value of the block is truthy.

Notice that we also changed the code within the block, on line 4. Although the original code on line 4 would produce the same result, it can be simplified to `n.even?`. `Integer#even?` returns a boolean (`true` or `false`) based on whether the calling `Integer` is an even number. Because this method invocation is the only line of code within the block, its `return` value will also be the `return` value of the block.
___
#### Notes
My initial expectation was that `Hash[] = []` would create a nested hash, however this presumption is wrong.

I must remember to check what a method is outputting, so I can be aware of what methods can be invoked by that value.  Here's an instance where I completely ignored that `Array` methods are at our disposal.
