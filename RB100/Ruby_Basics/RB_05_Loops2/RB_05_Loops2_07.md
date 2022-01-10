## Stop Counting
#### The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when the current number equals `2`.
```ruby
5.times do |index|
  # ...
end
```
___
#### Solution
```ruby
# SOLUTION 1.  STOPS ITERATING AT `2`, BUT DOESN'T OUTPUT `2`.

5.times do |index|
  puts index == 2 ? break : index
end


# SOLUTION 2.  OUTPUTS `2`, BUT BEGINS THE ITERATION FOR `3`.

5.times do |index|
  puts index > 2 ? break : index
end


# SOLUTION 3.  100% MEETS REQUIREMENTS.

5.times do |index|
  puts index
  break if index == 2
end
```
___
#### Solution, LS
Same as third solution, :sunglasses:.
#### Discussion
The `times` method counts from 0 to one less than the specified number. In this case, that number is 5. The block parameter `index` represents the current iteration number. We can print the current number with puts `index`.

To stop the loop, we can simply add `break`. However, we want to only stop iterating when the current number equals `2`. We can do this by adding the `if index == 2` condition to break.
#### Further Exploration
- Without running this code, how many values will be printed?
```ruby
5.times do |index|
  puts index
  break if index == 4
end
```
#### Solution
5 values will be output, 0...4.

Now, consider this code:
```ruby
5.times do |index|
  puts index
  break if index < 7
end
```
- How many values will be printed this time?
#### Solution
1 value will be output.  `#times` will output the first value, but stop at the first iteration of `break` because index starts at `0`.
___
#### Notes
