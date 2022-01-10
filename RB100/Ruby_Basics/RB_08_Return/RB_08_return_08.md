## Counting Sheep (Part 2)
#### What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep
```
___
#### Solution
```
0
1
2
3
4
10
```
Just like previously, `count_sheep` outputs 0 - 4.  However its return value is no longer `#times`, now it's `10`.
___
#### Solution, LS
```
0
1
2
3
4
10
```
#### Discussion
This exercise continues the previous exercise, except with one variation: `Integer#times` is no longer the last line in `count_sheep`. `#times` still returns the initial integer, but this time nothing is done with the return value. Instead, `10` is the implicit return value of `count_sheep` because it's the last line evaluated.
___
#### Notes
