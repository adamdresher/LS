## What Color?
#### Using the following code, select the value `'blue'` from `car` and print it with `#puts`.
```ruby
car = {
  type:    'sedan',
  color:   'blue',
  year:    2003
}
```
___
#### Solution
```ruby
car = {
  type:    'sedan',
  color:   'blue',
  year:    2003
}

puts "The car's color is #{car[:color]}."
```
___
#### Solution, LS
```ruby
puts car[:color]
```
#### Discussion
Selecting data from a hash is similar to adding it. `Hash#[]` returns the value associated with the given key, like this:
```ruby
car[:type]  # "sedan"
car[:color] # "blue"
car[:year]  # 2003
```
___
#### Notes
