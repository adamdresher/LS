## Launch School Printer (Part 1)
#### Write a program that prints `'Launch School is the best!'` repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.

#### For now, just use `#to_i` to convert the input value to an `Integer`, and check that result instead of trying to insist on a valid number; validation of numeric input is a topic with a fair number of edge conditions that are beyond the scope of this exercise.
Examples:
```
$ ruby lsprint.rb
>> How many output lines do you want? Enter a number >= 3:
5
Launch School is the best!
Launch School is the best!
Launch School is the best!
Launch School is the best!
Launch School is the best!

$ ruby lsprint.rb
>> How many output lines do you want? Enter a number >= 3:
2
>> That's not enough lines.
>> How many output lines do you want? Enter a number >= 3:
3
Launch School is the best!
Launch School is the best!
Launch School is the best!
```
___
#### Solution
```ruby
loop do
  puts '>> How many output lines do you want?'
  input = gets.chomp.to_i
  if input < 3
    puts '>> Oh, sorry I forgot to mention.  You have to pick the number 3 or higher... try again!'
  else
    input.times { puts 'Launch School is the best!' }
    break
  end
end
```
___
#### Solution, LS
```ruby
number_of_lines = nil
loop do
  puts '>> How many output lines do you want? Enter a number >= 3:'
  number_of_lines = gets.to_i
  break if number_of_lines >= 3
  puts ">> That's not enough lines."
end

while number_of_lines > 0
  puts 'Launch School is the best!'
  number_of_lines -= 1
end
```
#### Discussion
Like the previous exercise, our solution uses the soon-to-be-familiar pattern of looping to obtain a valid input. In this case, we use `#to_i` to convert inputs to Integer values, and only allow inputs of at least 3.

Once we have the number of lines to print, it's a simple matter to just print the lines in a loop.
___
#### Notes
`#chomp` isn't required when appended with `#to_i`.  This is because `\n` seems to be removed when the string is converted to an integer.
