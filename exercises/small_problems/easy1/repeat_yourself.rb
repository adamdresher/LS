# SOLUTION 1.
def repeat(string, num)
  num.times { |num| puts(string) }
end


# SOLUTION 2.  REFACTORED.
def repeat(string, num)
  num.times { puts string }
end
```
___
#### Solution, LS
```ruby
def repeat(string, number)
  number.times do
    puts string
  end
end
