What will the following program print to the screen? What will it return?

```
def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }
```

##### MY SOLUTION
The screen returns a proc object because Ruby doesn't know what to do with `block`.  `block` needs the `call` method appended to it in order to call the block passed to it.

The proc object is `#<Proc:0x00007fb66aa17278 (irb#1):4>`.  This seems to be a different type of exception than the ones I've come across so far.
