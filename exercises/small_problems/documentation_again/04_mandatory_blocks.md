```ruby
a = [1, 4, 8, 11, 15, 19]

p a.bsearch { |num| num > 8 } # => 11
```
I didn't know the `Array#bsearch`, but given the exercise description, I made the assumption that it will take and return a block.

Looking at the Ruby docs, my assumptions seem validated.  I tested the code in irb and found my guess to be correct.

- <https://docs.ruby-lang.org/en/master/Array.html#method-i-bsearch>

Next I looked for `#find` and `#select` and found them in the `Enumerable` module (`#select` can also be found in the `Array` class, however they seem to function the same).  `Array#bsearch` and `Enumerable#find` both take a block and return the first element which returns true.  The difference is that `#bsearch` uses a binary search, where `#find` searches by element.  I'm not clear on the explicit difference, but LS's exercise description implies that `#bsearch` is a faster method.  `#select` also searches by element, however it returns an array of all elements that return true in its block.

- <https://docs.ruby-lang.org/en/master/Enumerable.html#method-i-find>
- <https://docs.ruby-lang.org/en/master/Array.html#method-i-select>
