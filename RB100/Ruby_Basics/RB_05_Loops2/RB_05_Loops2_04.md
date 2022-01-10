## Get the Sum
#### The code below asks the user `"What does 2 + 2 equal?"` and uses `#gets` to retrieve the user's `answer`. Modify the code so `"That's correct!"` is printed and the `loop` stops when the user's `answer` equals `4`. Print `"Wrong answer. Try again!"` if the user's `answer` doesn't equal `4`.
```ruby
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
end
```
___
#### Solution
```ruby
# SOLUTION 1.
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  
  puts "That's correct!" && break if answer == 4
  puts "Wrong answer.  Try again!" if answer != 4
end


# SOLUTION 2.  USING TERNARY FORM.

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  
  puts answer == 4 ? "That's correct!" && break : "Wrong answer.  Try again!"
end
```
___
#### Solution, LS
```ruby
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i

  if answer == 4
    puts "That's correct!"
    break
  end

  puts 'Wrong answer. Try again!'
end
```
#### Discussion
To do anything with the user's input, we must first assign it to a variable. This makes it easier to modify the input or check its value later on. In this case, we'll check the value of `answer` in the `if` condition. If `answer` equals `4` then `"That's correct!"` will be printed and the `loop` will stop when `break` is processed. If `answer` equals anything other than `4` then the error will be printed and the `loop` will continue iterating.
___
#### Notes
