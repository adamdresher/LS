## Greeting Through Methods (Part 1)
#### Write two methods, one that returns the string `"Hello"` and one that returns the string `"World"`. Then print both strings using `#puts`, combining them into one sentence.
Expected output:

`Hello World`
___
#### Solution
```ruby
def hello
  'Hello'
end

def world
  'World'
end

puts hello + " " + world
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

puts "#{hello} #{world}"
```
#### Discussion
To do anything with the methods, we first have to define them. We've chosen to define our methods as `hello` and `world`. We've written both methods to only do one thing: return a string. This makes it easy for us to print the desired strings simply by calling the methods with `#puts`. Our solution uses string interpolation to achieve the desired output. Alternatively, we could have used string concatenation. We will see an example of that in the next problem.
___
#### Notes
