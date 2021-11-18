When you run the following code...

```
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)
```

You get the following error message..

```
exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end
```

Why do you get this error and how can you fix it?

##### MY SOLUTION
The syntax error occurs on line 8 because that is when the method is being invoked.  The error is due to a missing ```end``` command.
Based on the indentation, the ```if```/```else``` statement is missing an ```end``` command.
This can be fixed by adding an ```end``` statement on line 10.