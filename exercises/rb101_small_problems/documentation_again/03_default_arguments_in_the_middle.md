```ruby
=> [4, 5, 3, 6]
```

- First, unbound parameters from left to right take precedent when assigning arguments.
- Next, parameters with default values from left to right take precedent.

*Regardless, arguments are assigned in order of index.*

<https://docs.ruby-lang.org/en/master/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments>

This means `a` is assigned the first argument, `d` is assigned the third argument, then `b` is reassigned the second argument.  As a result, `c` uses its default value.
