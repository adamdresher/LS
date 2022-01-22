```ruby
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
```
Line 1 converts the argument into an array of strings.  Line 2 creates an empty array.  Line 3 iterates through each element of `array1` and pushes them to `array2`.  Line 4 again iterates through `array1`, this time upcasing any element that starts with the letters `'C'` or `'S'`.  The question then becomes, does the `<<` method bind the same strings between `array1` and `array2`.  If yes, then the mutation occurring on Line 4 also mutates `array2`.  Looking at the [Ruby docs](https://docs.ruby-lang.org/en/master/Array.html#method-i-3C-3C), it says:
  
  '*Appends `object` to `self`; returns `self`.*'

This indicates object assignment and means the arrays are bound to the same objects.  So yes, Line 4 mutates `array2` and Line 5 outputs upcased strings.
