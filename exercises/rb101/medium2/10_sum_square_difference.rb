# Problem:
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Example:
# sum_square_difference(3) == 22
    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150

# Input: An Integer
# Return: An Integer
# Goal: Determine the difference between 2 numbers:
#   sum of squared numbers 1..argument
#   the square of the sum of numbers 1..argument
# Rules:
#   squared Integers are 1..argument

# Examples:
# sum_square_difference(3) == 22
    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150

# Mental Model:
# Save the sum of the numbers 1 to argument and square the sum.  Square the numbers 1 to argument and save the sum.  Find the difference between the first and second number.

# Algorithm:
#  initialize squared_sum to:
#    sum of the numbers 1..argument
#    square the sum
# initialize sum_of_squared = 0
# iterate through numbers 1..argument
#   sum_of_squared += number squared
# subtract sum_of_squared from squared_sum

def sum_square_difference(num)
  squared_sum = (1..num).sum**2
  sum_of_squared = 0

  1.upto(num) { |num| sum_of_squared += num**2 }

  squared_sum - sum_of_squared
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150