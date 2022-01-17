# # SOLUTION 1.  MY INITIAL IDEA.
# puts "Hello, I'm your simple calculator and can perform the following operations:\n+  : addition\n-  : subtraction\n*  : multiplication\n/  : division\n** : square"

# puts 'Give me the first number:'
# num1 = gets.to_f

# puts 'Give me the type of operation:'
# operation = gets.chomp

# puts 'Give me the second number:'
# num2 = gets.to_f

# result = case operation
#            when '+'  then num1 +  num2
#            when '-'  then num1 -  num2
#            when '*'  then num1 *  num2
#            when '/'  then num1 /  num2
#            when '**' then num1 ** num2
#          end

# puts "#{num1} #{operation} #{num2} = #{result}"


# SOLUTION 2.  FOLLOWING LS TUTORIAL.
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}")
