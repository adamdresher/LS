# OBJECTIVES
# Retrieve two integers from user.
# Add user's integers and output the result.
# Require one integer to be positive and one to be negative, else restart from the beginning.
# Check integers after both have been retrieved.
# Any combination of integer polarity is acceptable.

# RESOURCES
# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string && number_string.to_i != 0
# end

# puts '>> Please enter a positive or negative integer:'
# puts '>> Invalid input. Only non-zero integers are allowed.'
# puts '>> Sorry. One integer must be positive, one must be negative.'
# puts '>> Please start over.'


# # SOLUTION 1.  USING NESTED LOOPS.

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string && number_string.to_i != 0
# end
# num1 = nil
# num2 = nil

# loop do
#   loop do
#     puts '>> Please enter a positive or negative integer:'
#     num1 = gets.chomp
#     (num1 = num1.to_i ; break) if valid_number?(num1) == true
#     puts '>> Invalid input. Only non-zero integers are allowed.'
#   end

#   loop do
#     puts '>> Please enter another positive or negative integer:'
#     num2 = gets.chomp
#     (num2 = num2.to_i ; break) if valid_number?(num2) == true
#     puts '>> Invalid input. Only non-zero integers are allowed.'
#   end

#   if (num1 > 0 && num2 > 0) || (num1 < 0 && num2 < 0)
#     puts '>> Sorry. One integer must be positive, one must be negative.'
#     puts '>> Please start over.'
#   else
#     break
#   end
# end

# result = num1 + num2
# puts "#{num1} + #{num2} = #{result}"


# # SOLUTION 2.  USING `while` & `until`.

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string && number_string.to_i != 0
# end

# loop do
#   num1 = nil
#   num2 = nil
#   puts ">> Let's do some basic addition!"

#   until num1 != 0 && num1 != nil
#     puts ">> What number are you thinking? (A positive or negative number is cool with me)"
#     num1 = gets # .to_i
#     num1 = num1.to_i ; break if valid_number?(num1)
#     (puts ">> I'm not smart enough to work with the number '0' and forgeeeet about giving me letters.\n>> Let's try again, eh?\n\n") if num1 == 0
#   end
  
#   while [0, nil].include?(num2) == true
#     puts 'Great, how about another number?'
#     num2 = gets # .to_i
#     num2 = num2.to_i ; break if valid_number?(num2)
#     (puts ">> I'm not smart enough to work with the number '0' and forgeeeet about giving me letters.\n>> Let's try again, eh?\n\n") if num2 == 0
#   end
  
#   if (0 < num1 && 0 < num2) || (0 > num1 && 0 > num2)
#     puts ">> I forgot to mention that I want one positve number and one negative number.\n>> Go ahead and try again.\n\n"
#   else
#     result = num1 + num2
#     puts ">> #{num1} + #{num2} = #{result}"
#     break
#   end
# end


# SOLUTION 3.  CREATING METHODS.

# NEW PLAN.
# - define method to define acceptable integer via user input
# - ask user for number
# - check if number is 0 or non-number, loop w error message if true (use LS method)
# - else break
# - use new method to define 2 numbers
# - check if numbers share the same polarity, loop w error message if true
# - else break w result output

# def valid_number?(number_string)
#   (number_string.to_i.to_s == number_string) && (number_string.to_i != 0)
# end

# def what_number?
#   num = nil
#   loop do
#     puts '>> Please enter a positive or negative integer:'
#     num = gets.chomp
#     valid_number?(num) ? break : puts('>> Invalid input. Only non-zero integers are allowed.')
#   end
#   num.to_i
# end

# def same_polarity(n1, n2)
#   (0 < n1 && 0 < n2) || (0 > n1 && 0 > n2)
# end

# loop do
#   num1 = what_number?
#   num2 = what_number?
#   result = num1 + num2

#   if same_polarity(num1, num2)
#     puts ">> I forgot to mention that I want one positve number and one negative number.\n>> Go ahead and try again.\n\n"
#   else
#     puts ">> #{num1} + #{num2} = #{result}"
#     break
#   end
# end


# SOLUTION, REFACTORED BASED ON LS'S SOLUTION USING 'return' instead of 'break' in `what_number?` & `break`/initiating variables in outer loop at the end.
# It doesn't feel particularly more readable, but cool to understand a different logic.
# Added `sleep()` based on Tariq Mojahdi's example.  So cool!!

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
