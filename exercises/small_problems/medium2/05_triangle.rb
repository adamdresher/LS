# Understanding the Problem:
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Input: 3 Integers
# Return: A Symbol
# Goal: Evaluate the argument to determine if it is a valid triangle, if so what kind.
# Rules:
#   invalid unless:
#     sum of the 2 shortest sides' lengths is greater than the longest side's length
#     no side has a length of 0
#   equilateral:
#     all 3 sides are equal length
#   isoscoles:
#     2 sides have equal length
#   scalene:
#     all 3 sides are of different length

# Mental Model:
# Check if the arguments define a triangle and return invalid if false.  Check if arguments are the same, return equalateral if true.  Check if 2 arguments are the same, return isosceles if true.  Else return scalene.

# ---
# Examples/Tests:
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid

# ---
# Data Structures:


# ---
# Algorithm:
# create array of 3 numbers
# return invalid unless triangle?
#   all numbers are greater than 0
#   all numbers are less than the sum of the other 2 numbers
# return equilateral if 3 numbers are the same
# return isoscoles if 2 numbers are the same
#   iterate through array:
#     check if number is in array twice
# return scalene

# ---
# Code:

def triangle(num1, num2, num3)
  sides = [num1, num2, num3]

  case
  when !triangle?(sides)                            then :invalid
  when sides.all? { |side| num1 == side }           then :equilateral
  when sides.any? { |side| sides.count(side) == 2 } then :isosceles
  else                                                   :scalene
  end
end

def triangle?(arr)
  arr.all? { |num| num > 0 } && arr.all? { |num| num < (arr.sum - num) }
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
