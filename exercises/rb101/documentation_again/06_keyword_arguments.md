```
5
8
# => 5
```
`Numeric#step` has some funky documentation.  The formatting is quite different from standard Ruby doc.  The documentation offers a number of method signatures.

`step(to = nil, by = 1) {|n| ... } → self`

`step(to = nil, by: 1) {|n| ... } → self`

`step(by: 1, to: ) {|n| ... } → self`

`step(by: , to: nil) {|n| ... } → self`

Each format will return an enumerator if no block is given.  With a block, it will return self.

- As you can also see, `by` and `to` are optional parameters.
- If neither use a key, then it's assumed the order is `to, by`.
- `by` can be given first if it's passed as a key.  In this case both can be passed as keys.
<https://docs.ruby-lang.org/en/master/Numeric.html#method-i-step>

As a result, the parameters could be rewritten as:
```ruby
5.step(by: 3, to: 10) { |value| puts value }
# or
5.step(10, 3) { |value| puts value }
```
