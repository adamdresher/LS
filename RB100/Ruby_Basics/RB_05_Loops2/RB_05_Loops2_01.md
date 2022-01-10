## Even or Odd?
#### Write a loop that prints numbers 1-5 and whether the number is even or odd. Use the code below to get started.
```ruby
count = 1

loop do
  count += 1
end
```
Expected output:

```
1 is odd!
2 is even!
3 is odd!
4 is even!
5 is odd!
```
___
#### Solution
```ruby
# SOLUTION 1.

count = 1

loop do
  puts count.even? ? "#{count} is even!" : "#{count} is odd!"
  count += 1
  break if count > 5
end


# SOLUTION 2.  NOT REFACTORED 100%, BUT MORE READABLE.

count = 1

loop do
  puts "#{count} is even!" if count.even?
  puts "#{count} is odd!"  if count.odd?
  break if count == 5
  count += 1
end
```
___
#### Solution, LS
```ruby
count = 1

loop do
  if count.even?
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end

  break if count == 5
  count += 1
end
```
#### Discussion
There are three main things going on inside this `loop`. First, `count` adds `1` to itself upon each iteration. This part was initially provided to you. Second, `break` is checking the value of `count` upon each iteration and will stop the `loop` if `count` equals `5`. Lastly, there is an `if`/`else` statement that prints whether a number is even or odd. The `if` condition takes advantage of the `Integer#even?` method to check whether `count` is an even number. If it is, then `"#{count} is even!"` will be printed, if not, then `"#{count} is odd!"` will be printed.
___
#### Notes
