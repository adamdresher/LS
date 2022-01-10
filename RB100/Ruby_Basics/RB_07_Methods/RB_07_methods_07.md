## Naming Animals
#### Run the code as it is shown below, and take notice of any error messages.
```ruby
def dog
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat}."
```
Based on what the error messages are telling you, update the relevant method definitions and method invocations as necessary so that the names are printed as shown below.

Expected output:
```
The dog's name is Spot.
The cat's name is Ginger.
```
___
#### Solution
```ruby
def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger)}."
```
___
#### Solution, LS
```ruby
def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."
```
#### Discussion
When running the original code, you should have gotten an error called `ArgumentError` that looks like this:
```
wrong number of arguments (given 1, expected 0) (ArgumentError)
```
This error is telling you that `dog` passed in an argument when it was invoked. However, `dog` doesn't accept any arguments. To fix this, we need to change `dog` so that it accepts one argument.

After fixing the error and running the code again, you should encounter the same type of error. It should look like this:
```
wrong number of arguments (given 0, expected 1) (ArgumentError)
```
This error is nearly identical to the first one, except it's reversed. Here, `cat` accepts one argument. However, no arguments were passed in when `cat` was invoked. To fix this, we need to add an argument when we invoke the method, like this: `cat('Ginger')`.

When you're writing methods, it's important to keep track of how many arguments the method accepts and how many it's given upon invocation. Both numbers need to match or an error will be thrown.
___
#### Notes
