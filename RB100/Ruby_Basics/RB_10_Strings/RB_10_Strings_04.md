## Dynamic String
#### Modify the following code so that the value of name is printed within "Hello, !".

```ruby
name = 'Elizabeth'

puts "Hello, !"
```
Expected output:

`Hello, Elizabeth!`
___
#### Solution
```ruby

```
___
#### Solution, LS
```ruby
name = 'Elizabeth'

puts "Hello, #{name}!"
```
#### Discussion
One of the advantages of using double-quotes is the ability to use string interpolation. With string interpolation, you can invoke a variable - or a method - within a string, and Ruby will automatically call #to_s on the value. This allows us to include dynamic values within a string.

In the solution, we include the `name` variable in the string by surrounding the invocation of it with curly braces (`{}`) and prepending those curly braces with the pound sign (`#`). This tells Ruby to evaluate the code within the curly braces.
___
#### Notes
