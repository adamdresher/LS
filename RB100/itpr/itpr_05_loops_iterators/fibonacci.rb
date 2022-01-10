# This is a program that recreates the fibonacci sequence.

def fibonacci(num)
  if num < 2
    num
  else
    fibonacci(num - 1) + fibonacci(num - 2)
  end
end

 fibonacci(10)


# Let's try to solve this without looking at LS's solution!

=begin
Logic:
A sequence of numbers which each number is the sum of the previous two numbers in the sequence.

Take user's input as an argument for when to stop program.
Begin by defining the output as the total of the previous number and defining the previous number as the number before that.
=end
=begin
puts "How long of a fibonacci sequence do you want?"
userNum = gets.chomp.to_i
puts " "

x = 0
num1 = 0
num2 = 1

loop do  # Does not output the first two numbers in the fibonacci sequence.
  if userNum == 0
    p "There's no fibonacci sequence for 0."
    break
  elsif userNum <= x
    break
  else
    if userNum == 1
      p 1
    else
      numTotal = num1 + num2
      p numTotal
      num1 = num2
      num2 = numTotal
    end
  x += 1
  end
end
=end

# Refactored! ... not really more concise or prettier.
=begin
puts "How long of a fibonacci sequence do you want?"
userNum = gets.chomp.to_i
puts " "
x = 1
fib1 = 0
fib2 = 1

def nextFibNum(num1, num2)
  numTotal = num1 + num2
  p numTotal
  num1 = num2
  num2 = numTotal
end

loop do
  case
    when userNum == 0
      p "There's no fibonacci sequence for 0."
      break
    when x > userNum
      break
    else
      userNum == 1 ? p(2) : nextFibNum(fib1, fib2)
        # A scope problem.  nextFibNum isn't updating fib1 and fib2.  So nextFibNum keeps using the same values in every iteration.  To solve this, nextFibNum could instead use an array and mutate the array.
      x += 1
    end
end
=end
