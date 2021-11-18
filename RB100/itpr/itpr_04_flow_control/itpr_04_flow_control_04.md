What will each block of code below print to the screen? Write your answer on a piece of paper or in a text editor and then run each block of code to see if you were correct.

> Snippet 1
```
'4' == 4 ? puts("TRUE") : puts("FALSE")
```

> Snippet 2
```
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end
```

> Snippet 3
```
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end
```

##### MY SOLUTIONS
**Snippet 1**
```FALSE```
The first operand for ```==``` is a string value of 4 while the second is an integer.  This evaluates to ```false```, so the associated expression is evaluated.

**Snippet 2**
```Did you get it right?```

**Snippet 3**
```Alright now!```

The expressions evaluate to:
if 11 <= 9  # false
elsif 11 >= 10  # true
elsif 10 == 10  # true, but too late.

