## Create a String
#### Create an empty string using the String class and assign it to a variable.
___
#### Solution
```ruby
a_new_string        = ""
another_new_string  = String::new
```
___
#### Solution, LS
```ruby
empty_string = String.new
```
___
#### Discussion
In Ruby, strings can be created in multiple ways. Empty strings, however, can only be created in two ways. In the solution, we use one of the two ways, which is invoking String's` ::new` class method. The second way involves the use of a string literal, like so:
```ruby
empty_string = ''
```
Ruby interprets string literals as `String` objects. Therefore, `''` and `String::new` accomplish the same task because they both return an empty string object.
___
#### Notes
`String.new == String::new == ''=> true`

`String.new = '' => ''`

`.new` and `::new` are syntatically different, but both seem to function in the same manner.

`a_new_string = '' => ''`

This way of creating a string uses variable assignment to create a string literal.
