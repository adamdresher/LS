Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

Factorial of x means multiplying with every iteration less than x.
https://www.cuemath.com/numbers/factorial/

##### MY SOLUTION
ATTEMPT 3
WORKS!
But why does counter need to be returned?  It is the last value in the loop, so it should return on it's own.

```
num = [ 5, 6, 7, 8 ]  # num is an array input.
def factorial(num_in)  # factorial is the method.
  counter = num_in  # counter is given a default value.  Default is set outside the loop, so it won't reset the loop's return value.
  # num_in += 1  # Cancels out the first iteration.
  while num_in > 2  # Loops until num_in is 3.
    counter = counter * (num_in - 1)  # This is the factorial equation.  Can be simplified by removing '-1' and moving 'num_in -= 1' above, but prefer to keep the equation's logic intact.
    num_in -= 1  # Iterates down.
    if num_in == 2 then return counter  # This works.  Still not sure why this method isn't returning the counter value once the loops complete.
    end
  end  # End of the loop.
end  # End of the factorial.

num.each { |num_out| puts factorial(num_out) }  # This iterates the array through the factorial method.
```

ATTEMPT 2
NOT WORKING.
Still don't see the problem.  Am now using pry to locate where this is falling flat.

```
num = [ 5, 6, 7, 8 ]
def factorial_eq(x)  # This seems to cycle fine and come to the desired results.  But they don't return.
  counter = x
  x.downto(1) do
    counter = counter * (x - 1)
  next if x == 1
    x -= 1
  end
end

num.each { |a| puts factorial_eq(a) }  # Iterates fine.  However, seems to be returning input.
puts factorial_eq(5)  # AAAARGH!  Still printing out the input instead of the final value.  ... or at least, the resulting value equals the input value.
# num.each { |a| solution << factorial_eq(a) }
# puts solution
```

ATTEMPT 1
NOT WORKING.
I don't see the issue.  Maybe I need fresh eyes.

```
num = [ 5, 6, 7, 8 ]
def factorial_eq(x)
   while x > 0 do
    answer = answer * (x - 1)
    x -= 1
   end
end

num.each { |a| puts factorial_eq(a) }
```
