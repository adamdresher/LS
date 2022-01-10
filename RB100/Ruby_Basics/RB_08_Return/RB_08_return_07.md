## Counting Sheep (Part 1)
#### What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
  end
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
5
```
`#times` outputs numbers because the block passed to it is iterating through the numbers and outputting them with `#puts`.  Even though `#puts` returns `nil`, `#times` returns its caller.  In this instance, `5` is the caller.  This value is passed to `count_sheep` and becomes its last evaluated value as well.  So when `puts count_sheep` is invoked, `5` becomes the last output.
___
#### Solution, LS
```
0
1
2
3
4
5
```
#### Discussion
We're using `Integer#times` within the `count_sheep` method to count from 0 to 4 (`#times` starts at 0). Therefore, it's no surprise that the output includes 0 through 4. What may be surprising, however, is the fact that the output includes 5. Where did that 5 come from? If you study `#times` in the Ruby docs, you'll know that after iterating 5 times, the block returns the initial integer. Which, in this case, is `5`.

We can use this knowledge combined with what we learned from the previous exercises to determine why `5` was printed. When looking at `count_sheep` we can see that the `#times` block is the only code in the method. This means it's also the last line in the method. Since `#times` returns the initial integer, we now know that the return value of `count_sheep` is `5`.
___
#### Notes
It's important to remember that by default, Ruby always starts with an index of 0.
