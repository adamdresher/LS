What does the following error message tell you?

```
ArgumentError: wrong number of arguments (1 for 2)
  from (irb):1:in `calculate_product'
  from (irb):4
  from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'
```

##### MY SOLUTION
This error tells me it is running Ruby code from irb.
It says there is only one argument provided where there should be two.
```calculate_product``` seems to be a method referenced on line 1 and 4.  It seems to be called but only one argument is defined.
