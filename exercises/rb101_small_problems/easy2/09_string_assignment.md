```ruby
BOB
BOB
```
`name` and `save_name` are pointing to the same `String` object, `'bob'`.  So when `name.upcase!` is invoked, the object both local variables are pointed to is mutated.

In the initial example `name` was assigned to a new `String` object, `'Alice'`, and did not mutate the original string.  Therefore `name` and `save_name` were pointed at different strings.
