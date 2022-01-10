## First Car
#### Create a hash that contains the following data and assign it to a variable named `car`.
| **type**	| **color** |	**mileage** |
| --------- | --------- | ----------- |
| sedan     |	blue    	| 80_000      |
___
#### Solution
```ruby
car = {
  'type' => 'sedan'
  'color' => 'blue'
  'mileage' => '80_000'
}
```
___
#### Solution, LS
```ruby
car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000
}
```
#### Discussion
Along with arrays, hashes are among the most used data structures. To write a hash, we surround one or more key-value pairs with braces (`{}`), like this:
```ruby
{ number: 1 }
```
Notice the syntax used when defining the key-value pair. This syntax was introduced in Ruby 1.9 and makes writing a hash much simpler. The older syntax looks like this:
```ruby
{ :number => 1 }
```
We'll use `Symbols` as keys in most of these exercises, but we can just as easily use `Strings`. `Symbols` are faster and use less memory than `Strings`, so are preferred as `Hash` keys. Note also that `Symbols` and `Strings` aren't the same when compared. Consider the following:
```ruby
:color == 'color' # false
```
When creating a hash using `Strings` as keys, keep in mind the required syntax:
```
car = {
  'type'    => 'sedan',
  'color'   => 'blue',
  'mileage' => 80_000
}
```
___
#### Notes
