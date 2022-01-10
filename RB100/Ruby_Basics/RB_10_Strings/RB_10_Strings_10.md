## Pluralize
#### Using the following code, print `true` if `colors` includes the color `'yellow'` and print `false` if it doesn't. Then, print `true` if `colors` includes the color `'purple'` and print `false` if it doesn't.
```ruby
colors = 'blue pink yellow orange'
```
Expected output:
```
true
false
```
___
#### Solution
```ruby
# SOLUTION 1.  USING `include?`
colors = 'blue pink yellow orange'

puts colors.include?('yellow')
puts colors.include?('purple')


# SOLUTION 2.  USING `match?`
colors = 'blue pink yellow orange'

puts colors.match?('yellow')
puts colors.match?('purple')
```
___
#### Solution, LS
```ruby
colors = 'blue pink yellow orange'

puts colors.include?('yellow')
puts colors.include?('purple')
```
#### Discussion
To check whether a given string includes a specific substring, we can use String's `#include?` method. `#include?` checks the calling string to see whether it contains the argument as a substring. It returns `true` if the argument is a substring, and `false` if it isn't.
#### Further Exploration
Let's say `colors` is changed to the following value:
```ruby
colors = 'blue boredom yellow'
```
and we invoke `#include?` as we did before:

```ruby
puts colors.include?('red')
```
What will the output be? Why?
#### Solution
`true`

`colors` is assigned to (or pointed to) a string object.  This means `#inlcude?` is pointed at one object, not a list of objects.  `#include?` also doesn't differentiate between words and characters.  It looks for the pattern given as a parameter.  Since `red` can be found in `boredom`, `true` is returned.
___
#### Notes
