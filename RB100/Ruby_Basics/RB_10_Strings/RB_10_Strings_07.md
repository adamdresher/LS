## Goodbye, not Hello
#### Given the following code, invoke a destructive method on `greeting` so that `Goodbye!` is printed instead of `Hello!`.

```ruby
greeting = 'Hello!'
puts greeting
```
Expected output:

`Goodbye`
___
#### Solution
```ruby
greeting = 'Hello!'

puts greeting
puts greeting.sub!(/Hello/, 'Goodbye')
```
___
#### Solution, LS
```ruby
greeting = 'Hello!'

greeting.gsub!('Hello', 'Goodbye')
puts greeting
```
#### Discussion
Ruby provides a great String method named `String#gsub!` that allows us to replace specific characters within the string by modifying the original object. In the solution, we use the destructive version of `#gsub` by invoking it on `greeting` before invoking `#puts`. We could have also used the non-destructive version, like so:
```ruby
greeting = 'Hello!'

puts greeting.gsub('Hello', 'Goodbye')
```
This works because `#gsub` returns the modified string.
___
#### Notes
