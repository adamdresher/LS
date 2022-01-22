```ruby
puts a.fetch(7) # => ' '
puts a.fetch(7, 'beats me') # => ' '
puts a.fetch(7) { |index| index**2 } # => nil
```
Because of the third test, I'm guessing that `#fetch` is an `Array` method and is fetching an element at an index given by it's parameter.  If the caller doesn't have an element at given index, it returns its second parameter.  If its given a block, it passes the element to the block.  I don't know what the `%w` in the `a` variable means though... probably nothing important, jk.  Let's check Ruby docs and see if my hunch is correct!

My hunch is mostly correct!  This is an `Array` method and functions as I expected except in the last case, which a block.  The block acts as a default value.  In other words if there is no element at the index provided by the first parameter, then the first parameter is passed to the block and returned.  So the last `puts` returns `' '`:

`puts a.fetch(7) { |index| index**2 } # => ' '`

- <https://docs.ruby-lang.org/en/master/Array.html#method-i-fetch>

But what about that shifty looking `%w`.  I was too confident and clicked on LS's solution and for a flash saw that my answers are incorrect.  A quick irb test tells me that `%w` is turning `(a b c d e)` into an array with the whitespaces ignored.  `a` is being assigned `['a', 'b', 'c', 'd', 'e']` instead of `['a', ' ', 'b', ' ', 'c', ' ', 'd', ' ', 'e']`

This means the outputs should be:
```ruby
puts a.fetch(7) # => IndexError
puts a.fetch(7, 'beats me') # => 'beats me'
puts a.fetch(7) { |index| index**2 } # => 49
```
