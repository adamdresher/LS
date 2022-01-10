## Print Until
#### Given the array of several numbers below, use an `until` loop to print each number.
`numbers = [7, 9, 13, 25, 18]`

Expected output:

```
7
9
13
25
18
```
___
#### Solution
```ruby
# SOLUTION 1.  DESTRUCTIVE/MUTATES `numbers`.

numbers = [7, 9, 13, 25, 18]
num = 0

until num == 5
  puts numbers.shift
  num += 1
end


# SOLUTION 2.  NON-DESTRUCTIVE.

numbers = [7, 9, 13, 25, 18]
num = 0

until num == 5
  numbers.each {|n| p n; num += 1}
end
```
___
#### Solution, LS
```ruby
numbers = [7, 9, 13, 25, 18]
count = 0

until count == numbers.size
  puts numbers[count]
  count += 1
end
```
```ruby
# SOLUTION 3.  RIFTING OFF LS.  DESTRUCTIVE/MUTATES `numbers`.
numbers = [7, 9, 13, 25, 18]

until numbers == []
  puts numbers.shift
end


# SOLUTION 4.  RIFTING OFF LS.  NON-DESTRUCTIVE.

numbers = [7, 9, 13, 25, 18]
num = 0

until num == numbers.size
  numbers.each {|n| p n; num += 1}
end
```
#### Discussion
There are multiple ways we could have used `until` to accomplish this task. Our solution uses a `counter` variable to track the current iteration number. This number gets incremented upon each iteration.

Using `count` helps us in two ways. First, it lets us control the number of iterations. In this case, we want to stop iterating when `count` equals the length of `numbers`. Second, we use it to select the next value in the array. This works because `count` matches the index of each number we want to print.
___
#### Notes
