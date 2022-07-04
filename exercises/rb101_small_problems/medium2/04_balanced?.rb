# Understanding the Problem:
# Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Input: A String
# Return: A Boolean
# Goal: Determine if the argument contains matching pairs of opening and closing paratheses.
# Rules:
#   if no parantheses found, true
#   if an opening paratheses is found, a closing parantheses must be included after it
#   opening and closing parantheses pair up and cannot be reused


# Mental Model:


# ---
# Examples/Tests:
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false

# ---
# Data Structures:
# idea 1:
# counter = 0, -1 for opening parantheses and +1 for closing parantheses
# 'What (is) this?' => -1 => 0 => true
# 'What is) this?' => 1 => false
# '((What)) (is this))?' => -1 => -2 => -1 => 0 => -1 => 0 => 1 => false
# ')Hey!(' => 1 => 0 => true
#  incorrect.  parantheses are out of order

# idea 2:
# when opening parantheses found, add element
# when closing paratheses found, remove element
# return false, if elements found after iteration
#   else, return true
# 'What (is) this?' => [x] => []
# 'What is) this?' => []
# ')Hey!(' => [] => [x]
# '((What)) (is this))?' => [x] => [x, x] => [x] => [] => [x] = [] = []
#   incorrect.  last closing paratheses is not accounted for

# idea 3:
# counter = []
# when opening parantheses found, add '(' to counter
# when closing paratheses found, add ')' to counter
# iterate through counter:
#   return false, if first element is ')'
#   

# idea 4:
# when opening parantheses found
#   add element to counter Array
# when closing paratheses found
#   return false, if no elements found in counter Array
#   remove element
# return false, if elements found after iteration
#   else, return true
# 'What (is) this?' => [x] => [] => false
# 'What is) this?' => false
# ')Hey!(' => false
# '((What)) (is this))?' => [x] => [x, x] => [x] => [] => [x] = [] = false

# ---
# Algorithm:
# initialize an empty counter Array
# iterate through the String argument:
#   if opening parantheses found
#     add element to counter Array
#   if closing paratheses found
#     return false, if no elements found in counter Array
#     remove element
# return false, if elements found in counter Array
#   else, return true

# ---
# Code:

def balanced?(str)
  counter = []

  str.each_char do |char|
    if char == '('
      counter << char
    elsif char == ')'
      return false if counter.empty?
      counter.pop
    end
  end

  return false if counter.any?
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
