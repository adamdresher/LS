# Understanding the Problem:
# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

# A triangle is classified as follows:
# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Input: 3 Integers
# Return: A Symbol
# Goal: Evaluate the numbers and determine if they represent a triangle, if so whay kind
# Rules:
#   triangle:
#     all numbers are greater than 0
#     the sum of the numbers is 180
#   right:
#     one number is 90
#   acute:
#     all numbers are less than 90
#   obtuse:
#     one number is greater than 90

# Mental Model:
#   Check if the numbers create a valid triangle.  If false, return invalid.  If true, determine what kind of triangle it is.  Check if any number is 90, if true return right.  Check if any number is larger than 90, if true return obtuse.  Else, return acute.

# ---
# Examples/Tests:
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid

# ---
# Data Structures:


# ---
# Algorithm:
#   initialize an array containing all the numbers
#   check if the numbers create a valid triangle
#     all numbers are greater than 0
#     sum of all numbers is 180
#   if false, return invalid
#   if true, determine what kind of triangle it is
#     check if any number is 90, if true return right
#     check if any number is larger than 90, if true return obtuse
#     else, return acute

# ---
# Code:

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]

  case
  when !triangle?(sides)              then :invalid
  when sides.any? { |num| num == 90 } then :right
  when sides.any? { |num| num > 90 }  then :obtuse
  else                                     :acute
  end
end

def triangle?(sides)
  sides.all? { |num| num > 0 } && sides.sum == 180
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
