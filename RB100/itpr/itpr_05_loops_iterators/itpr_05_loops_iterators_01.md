What does the each method in the following program return after it is finished executing?

```ruby
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
```
##### MY SOLUTION
The ```each``` method iterates through the array and adds 1 to each of its values.
But ```each``` doesn't mutate its object and returns the array's original values.