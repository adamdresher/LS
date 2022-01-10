## Opposits Attract
#### Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.
Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.

You may use the following method to validate input integers:
```
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end
```

Examples:
```
$ ruby opposites.rb
>> Please enter a positive or negative integer:
8
>> Please enter a positive or negative integer:
0
>> Invalid input. Only non-zero integers are allowed.
>> Please enter a positive or negative integer:
-5
8 + -5 = 3

$ ruby opposites.rb
>> Please enter a positive or negative integer:
8
>> Please enter a positive or negative integer:
5
>> Sorry. One integer must be positive, one must be negative.
>> Please start over.
>> Please enter a positive or negative integer:
-7
>> Please enter a positive or negative integer:
5
-7 + 5 = -2
```
___
#### Solution
```ruby
# SOLUTION 1.  USING NESTED LOOPS.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end
num1 = nil
num2 = nil

loop do
  loop do
    puts '>> Please enter a positive or negative integer:'
    num1 = gets.chomp
    (num1 = num1.to_i ; break) if valid_number?(num1) == true
    puts '>> Invalid input. Only non-zero integers are allowed.'
  end

  loop do
    puts '>> Please enter another positive or negative integer:'
    num2 = gets.chomp
    (num2 = num2.to_i ; break) if valid_number?(num2) == true
    puts '>> Invalid input. Only non-zero integers are allowed.'
  end

  if (num1 > 0 && num2 > 0) || (num1 < 0 && num2 < 0)
    puts '>> Sorry. One integer must be positive, one must be negative.'
    puts '>> Please start over.'
  else
    break
  end
end

result = num1 + num2
puts "#{num1} + #{num2} = #{result}"


# SOLUTION 2.  USING `while` & `until`.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do
  num1 = nil
  num2 = nil
  puts ">> Let's do some basic addition!"

  until num1 != 0 && num1 != nil
    puts ">> What number are you thinking? (A positive or negative number is cool with me)"
    num1 = gets # .to_i
    num1 = num1.to_i ; break if valid_number?(num1)
    (puts ">> I'm not smart enough to work with the number '0' and forgeeeet about giving me letters.\n>> Let's try again, eh?\n\n") if num1 == 0
  end
  
  while [0, nil].include?(num2) == true
    puts 'Great, how about another number?'
    num2 = gets # .to_i
    num2 = num2.to_i ; break if valid_number?(num2)
    (puts ">> I'm not smart enough to work with the number '0' and forgeeeet about giving me letters.\n>> Let's try again, eh?\n\n") if num2 == 0
  end
  
  if (0 < num1 && 0 < num2) || (0 > num1 && 0 > num2)
    puts ">> I forgot to mention that I want one positve number and one negative number.\n>> Go ahead and try again.\n\n"
  else
    result = num1 + num2
    puts ">> #{num1} + #{num2} = #{result}"
    break
  end
end


# SOLUTION 3.  CREATING METHODS.
# - define method to define acceptable integer via user input
# - ask user for number
# - check if number is 0 or non-number, loop w error message if true (use LS method)
# - else break
# - use new method to define 2 numbers
# - check if numbers share the same polarity, loop w error message if true
# - else break w result output
def valid_number?(number_string)
  (number_string.to_i.to_s == number_string) && (number_string.to_i != 0)
end

def what_number?
  num = nil
  loop do
    puts '>> Please enter a positive or negative integer:'
    num = gets.chomp
    valid_number?(num) ? break : puts('>> Invalid input. Only non-zero integers are allowed.')
  end
  num.to_i
end

def same_polarity(n1, n2)
  (0 < n1 && 0 < n2) || (0 > n1 && 0 > n2)
end

loop do
  num1 = what_number?
  num2 = what_number?
  result = num1 + num2

  if same_polarity(num1, num2)
    puts ">> I forgot to mention that I want one positve number and one negative number.\n>> Go ahead and try again.\n\n"
  else
    puts ">> #{num1} + #{num2} = #{result}"
    break
  end
end
```
___
#### Solution, LS
```ruby
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def read_number
  loop do
    puts '>> Please enter a positive or negative integer:'
    number = gets.chomp
    return number.to_i if valid_number?(number)
    puts '>> Invalid input. Only non-zero integers are allowed.'
  end
end

first_number = nil
second_number = nil

loop do
  first_number = read_number
  second_number = read_number
  break if first_number * second_number < 0
  puts '>> Sorry. One integer must be positive, one must be negative.'
  puts '>> Please start over.'
end

sum = first_number + second_number
puts "#{first_number} + #{second_number} = #{sum}"
```
#### Discussion
In this exercise we demonstrate how to handle multiple inputs that must be validated both independently and together; this is done by using a loop inside another loop (nested loops), but it is often easier to simply refactor the input loop into a separate method (or multiple methods if needed). We take this approach with our solution.

Of course, we use the provided `valid_number?` method for validation. This differs from the `valid_number?` we used previously in that it also treats `0` as an invalid entry.

Next, we have a `read_number` method that we use for our standard get-some-input pattern. The main difference here is that we `return` from the method instead of using `break` to exit the loop. (You can also use `break number.to_i`, but since we really want to `return` instead, we use `return`.)

We then initialize our two input variables, then start a loop that reads each of the 2 numbers, then exits if their product is negative, or issues an error message and repeats the loop if the product is positive. Note that the product is negative if and only if one number is positive, the other negative, so this satisfies our requirement that one number be positive, the other negative.

Finally, we add the two numbers together and print the result.
___
#### Notes
```ruby
# SOLUTION, REFACTORED BASED ON LS'S SOLUTION.  USING 'return' INSTEAD OF 'break' IN `what_number?` & `break`/INITIATING VARIABLES IN OUTER LOOP AT THE END.
# It doesn't feel particularly more readable, but cool to understand a different logic.
def valid_number?(number_string)
  (number_string.to_i.to_s == number_string) && (number_string.to_i != 0)
end

def what_number?
  num = nil
  loop do
    puts '>> Please enter a positive or negative integer:'
    num = gets.chomp
    return num.to_i if valid_number?(num)
    puts('>> Invalid input. Only non-zero integers are allowed.')
    sleep(1)
  end
end

def same_polarity(n1, n2)
  (0 < n1 && 0 < n2) || (0 > n1 && 0 > n2)
end

num1 = nil
num2 = nil
result = nil

loop do
  num1 = what_number?
  num2 = what_number?
  result = num1 + num2

  break if same_polarity(num1, num2) == false
  puts ">> I forgot to mention that I want one positve number and one negative number.\n>> Go ahead and try again.\n\n"
  sleep(1)
end
puts ">> #{num1} + #{num2} = #{result}"
```
