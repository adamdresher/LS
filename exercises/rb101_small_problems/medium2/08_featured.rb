# Problem:
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

# Input: An Integer
# Return: An Integer (next featured number)
# Goal: Return the next featured number after the argument
# Rules:
#   if no featured number after the argument exists, return an error message
#   featured number:
#     number is odd
#     number is a factor of 7
#     number contains all unique digits
#     if number is more than 9 digits, return an error message

# Mental Model:
#   check the next number divisible by 7 after argument.  If the number is more than 9 digits long, return an error message.  Else if its a featured number, return it.  Else, check the next number divisible by 7.

# Examples:
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987
# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Data Structure:
# 12 => 14 => 21

# Algorithm:
#   loop
#     pass num to next_num_divisible_by_7 and return next num
#     return an error_message, if the num is more than 9 digits long
#     return num, if its a valid_num?

#   next_num_divisible_by_7
#     divide num by 7
#     round down
#     mulitply by 7
#     add 7
#     return num

#   valid_num?
#     check:
#       num is odd?
#       num contains only unique digits

# Code:
def featured(num)
  error_message =
    '=> There is no possible number that fulfills those requirements'

  loop do
    num = next_num_divisible_by_7(num)
    return error_message if num.digits.size > 9
    return num if valid_num?(num)
  end
end

def next_num_divisible_by_7(num)
  num / 7 * 7 + 7
end

def valid_num?(num)
  num.odd? && num.digits.uniq.size == num.digits.size
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
