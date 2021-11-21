Why does the following code...

```
def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
```

Give us the following error when we run it?

```
block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
from test.rb:5:in `<main>'
```

##### MY SOLUTION
Currently when `execute` is invoked, its expecting an argument (not a block) to be passed to it for the variable `block`.
There is a syntax error when defining `execute`'s parameter.  The variable needs to be prefixed with `&`.  The `&` identifies a variable as a block to be passed when `execute` is invoked.
