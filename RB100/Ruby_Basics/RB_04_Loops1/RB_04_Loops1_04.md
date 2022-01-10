## Loop on Command
#### Modify the code below so the loop stops iterating when the user inputs `'yes'`.
```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
end
```
___
#### Solution
```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
end
```
___
#### Solution, LS
```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Incorrect answer. Please answer "yes".'
end
```
#### Discussion
This is a practical example of how a `loop` can be used to retrieve and handle user input. In the initial code, the `loop` continued iterating regardless of the input's value. To change that, we add `break` with an `if` condition. The condition, in this case, needs to be `answer == 'yes'`. This tells `break` to only execute if the input value is `'yes'`.

We added a simple error message after `break` to demonstrate that `break` doesn't have to be at the end of the `loop` to do its job. Also, providing an error message can be useful in providing a better user experience when dealing with inputs.
___
#### Notes
