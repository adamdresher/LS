## What Color Are You?
#### In the code below, an array containing different types of colors is assigned to `colors`.
```ruby
colors = ['red', 'yellow', 'purple', 'green']
```
Use `Array#each` to iterate over colors and print each element.

Expected output:
```
I'm the color red!
I'm the color yellow!
I'm the color purple!
I'm the color green!
```
___
#### Solution
```ruby
colors = ['red', 'yellow', 'purple', 'green']

colors.each { |color| puts "I'm the color #{color}!"}
```
___
#### Solution, LS
```ruby
colors.each do |color|
  puts "I'm the color #{color}!"
end
```
#### Discussion
Iteration is a key task when it comes to Arrays. When using `#each`, it's important to note the block parameter: here we use `color`. This represents the element in the current iteration and can be named whatever you want. Knowing this, it is easy to print each element simply by using `#puts`.
___
#### Notes
