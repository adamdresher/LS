## Make and Model
#### Using the following code, write a method called `car` that takes two arguments and prints a string containing the values of both arguments.
`car('Toyota', 'Corolla')`

Expected output:

`Toyota Corolla`
___
#### Solution
```ruby
def car(make, model)
  puts make + ' ' + model
end

car('Toyota', 'Corolla')
```
___
#### Solution, LS
```ruby
def car(make, model)
  puts "#{make} #{model}"
end

car('Toyota', 'Corolla')
```
#### Discussion
When writing the `car` method it's important to keep two things in mind. First, make sure you're allowing for the correct number of parameters. If the method invocation provides two arguments, then the method must be able to accept two arguments and vice versa. Second, when printing the string, you should use `#puts` from inside the method. In this exercise, the method invocation isn't prepended by `#puts`, therefore, to print the string you have to print it from within the method.
#### Further Exploration
Remove the `#puts` call from the `car` method. Modify your program so it still prints the result.

How do the return values of `car` differ with and without the `#puts`?
```ruby
def car(make, model)
  make + ' ' + model
end

puts car('Toyota', 'Corolla')
```
___
#### Notes
If `#puts` is removed from `car`, it will return `make + ' ' + model`.  However if `#puts` is prepended when invoking `car`, the return value will once again be `nil`.  The easiest way to retrieve the evaluated value would be to use `#p` or to call `car` without outputting it.
