## Greeting Through Methods (Part 2)
#### Write a method named `greet` that invokes the following methods:
```ruby
def hello
  'Hello'
end
```
```ruby
def world
  'World'
end
```
When `greet` is invoked with `#puts`, it should output the following:

`Hello World`
Make sure you add a space between `"Hello"` and `"World"`, however, you're not allowed to modify `hello` or `world`.
___
#### Solution
```ruby
def hello
  'Hello'
end

def world
  'World'
end

def greet
  string = hello + ' ' + world
end

puts greet
```
___
#### Solution, LS
```ruby
def hello
  'Hello'
end

def world
  'World'
end

def greet
  hello + ' ' + world
end

puts greet
```
#### Discussion
In the previous exercise, we invoked `hello` and `world` using string interpolation and printed their values with `#puts`. In this exercise, however, we're extracting that combination and placing it in a method named greet. We invoke both methods as we did before, but this time we choose not to use string interpolation (though we could). We simply invoke the methods and use the `+` sign to combine their values. If we do `hello + world`, and don't account for an extra space, the output will look like this:

`HelloWorld`

That's not very readable so it'd be good to add a space between the two words. To do that, we place a string containing one space between the method invocations.

`hello + ' ' + world # => Hello World`
___
#### Notes
