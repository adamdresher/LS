## Required Arguments
#### Assume you have this Array:
`a = %w(a b c d e)`

How would you use `Array#insert` to insert the numbers `5`, `6`, and `7` between the elements with values `'c'` and `'d'`?
___
#### Solution
`a.insert(3, 5, 6, 7)`
___
#### Solution, LS
`a.insert(3, 5, 6, 7)`
#### Discussion
The documentation for `Array#insert` shows that its signature as:

`insert(index, obj...) → ary`

As with the previous exercise, this isn't too helpful until you understand what it is telling you.

The part to the left of the **→** shows that `insert` takes a required `index` argument, and `0` or more `obj` arguments. We know that `index` is required because the name is shown in the signature with no ornamentation; such standalone names in the arguments portion of a signature are required arguments. Similarly, we know that we need `0` or more `obj` arguments because this time the name is adorned by `...`, which should always be interpreted in the documentation as "0 or more occurrences of the item to the left".

You will also see 0 or more arguments written as `*obj` or as `[obj]*`. In fact, both of these are probably more common than the `...` adornment.

Reading the text below the signature, we see that `index` represents the index of the `Array` element before which we want to insert new elements. Since we want to insert `5`, `6`, and `7` before the element that currently contains `'d'`, and since that element has index `3`, we know that the first argument to `insert` will be `3`.

You have to read between the lines to understand the `obj...` part; the text does not mention anything using the name `obj;` instead, it says "insert the given values before `...`". Given that `obj...` is not mentioned, and since nothing in the signature shows the word `value`, we're left to conclude that each of the values must be one of the 0 or more `obj` arguments. So, we'll use `5`, `6`, and `7` as the remaining arguments:

`insert(3, 5, 6, 7)`

Since `insert` is an instance method of the `Array` class, we need to apply it to an `Array` object, namely `a`:

`a.insert(3, 5, 6, 7)`

Finally, we must ask if we need do anything with the return value. Going back to the signature, we see that the return value is given as `ary`, not `new_ary`; this usually means that the return value is the object to which the method was applied; `a` in this case. Since `#insert` modifies something, it must have modified `a`, so it really doesn't matter if we use the return value, or just continue to use `a` directly; do whichever is most natural for the situation.

To illustrate this:
```ruby
puts a.insert(3, 5, 6, 7).inspect # => ["a", "b", "c", 5, 6, 7, "d", "e"]
puts a.inspect                    # => ["a", "b", "c", 5, 6, 7, "d", "e"]
```
These two statements produce identical results; this shows that both `a` and the return value have the same values. In fact, they are the same object, though it needs a bit more work to show that:
```ruby
b = a.insert(3, 5, 6, 7)
puts a.object_id            # => 70127114718140
puts b.object_id            # => 70127114718140
```
___
#### Notes
