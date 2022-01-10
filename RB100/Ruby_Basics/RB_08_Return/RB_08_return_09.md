## Counting Sheep (Part 3)
#### What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep
```
___
#### Solution
```
0
1
2
nil
```
In this instance, `if sheep >= 2` forces the method to return and stop.  The `#p` then outputs the last return value, which is `nil`.  `#puts` makes every return value `nil`, and `#p` outputs the return value.  If `#puts` was used, the output would be ` ` as `nil` converted to a string is ` `.
___
#### Solution, LS
```
0
1
2
nil
```
#### Discussion
This exercise is a little different compared to the last two. We've made `Integer#times` the last line in c`ount_sheep` again, but this time there's a `return` inside the block. Based on what we know with `return`, we should be able to determine the return value of `count_sheep`. Looking at the if condition, we can see that `return` will be processed once `sheep` equals `2`. This lets us know the method will end there and return the value provided by `return`.

In this case, `return` didn't provide a value. That's why the last output is `nil` (we used `#p` when invoking `count_sheep` so that `nil` is visible in the output).
___
#### Notes
