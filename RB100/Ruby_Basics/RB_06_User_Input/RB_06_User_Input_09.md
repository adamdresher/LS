## Launch School Printer (Part 2)
#### In an earlier exercise, you wrote a program that prints `'Launch School is the best!'` repeatedly until a certain number of lines have been printed. Our solution looked like this:
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
Modify this program so it repeats itself after each input/print iteration, asking for a new number each time through. The program should keep running until the user enters `q` or `Q`.

Examples:
```
$ ruby lsprint2.rb
>> How many output lines do you want? Enter a number >= 3 (Q to quit):
5
Launch School is the best!
Launch School is the best!
Launch School is the best!
Launch School is the best!
Launch School is the best!
>> How many output lines do you want? Enter a number >= 3 (Q to quit):
2
>> That's not enough lines.
>> How many output lines do you want? Enter a number >= 3 (Q to quit):
3
Launch School is the best!
Launch School is the best!
Launch School is the best!
>> How many output lines do you want? Enter a number >= 3 (Q to quit):
q
```
___
#### Solution
```ruby
# SOLUTION 1.
number_of_lines = nil
question = '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
message = 'Launch School is the best!'
invalid = ">> That's not enough lines."

loop do
  loop do
    puts question
    number_of_lines = gets.chomp
    number_of_lines.downcase == 'q' ? break : number_of_lines = number_of_lines.to_i
    break if number_of_lines >= 3
    puts invalid
  end

  if number_of_lines.class == Integer
    while number_of_lines > 0
      puts message
      number_of_lines -= 1
    end
  else
    break
  end
end

# SOLUTION 2.  USING MY ORIGINAL SOLUTION FROM `lsprint.rb`.
input = nil

loop do
  puts '>> How many output lines do you want?'
  input = gets.chomp

  if input.downcase == 'q'
    break
  elsif input.to_i < 3
    puts '>> Oh, sorry I forgot to mention.  You have to pick the number 3 or higher... try again!'
  else
    input.to_i.times { puts 'Launch School is the best!' }
  end
  
  break if input.downcase == 'q'
end
```
___
#### Solution, LS
```ruby
loop do
  input_string = nil
  number_of_lines = nil

  loop do
    puts '>> How many output lines do you want? ' \
         'Enter a number >= 3 (Q to Quit):'

    input_string = gets.chomp.downcase
    break if input_string == 'q'

    number_of_lines = input_string.to_i
    break if number_of_lines >= 3

    puts ">> That's not enough lines."
  end

  break if input_string == 'q'

  while number_of_lines > 0
    puts 'Launch School is the best!'
    number_of_lines -= 1
  end
end
```
#### Discussion
Our solution requires an outer loop to control the repetition of the input and output processes. We also need to change how inputs are handled since we can have both numeric and alphabetic (`q` or `Q`) inputs, and must account for both.

We store the actual input string in `input_string`, get rid of the newline, and convert it to lowercase. We then break out of the inner loop if `input_string` is a `q`. The rest of the inner loop is just like our original program: we convert the input to a number, and ensure the value is at least 3.

Our inner loop is followed by a second break if `input_string == 'q'` to break out of the outer loop if the user quit. This is necessary since a `break` inside a loop always exits the innermost containing loop, so the break in the inner loop can't exit the outer loop.

___
The two breaks for `input_string == 'q'` are repetitive and a bit ugly. Better solutions are possible, but beyond the scope of this exercise.
___
#### Notes
