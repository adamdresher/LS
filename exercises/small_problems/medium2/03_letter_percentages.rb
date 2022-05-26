# Understanding the Problem:
# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Input: A String
# Return: A Hash
# Goal: Determine the number of lowercase, uppercase, and other characters within the argument, then return these values as a percentage in a Hash
# Rules:
#   whitespaces are included as other characters
#   percentage should be displayed to 1 decimal place (0.0)

# Mental Model:
#   Initialize a Hash with 3 symbol keys, :lowercase, :uppercase, :neither- all set to 0.  Iterate through the argument's characters and each iteration, add 1 to the appropriate key's value.  Mutate the values by dividing them by the length of the argument.

# ---
# Examples/Tests:
# letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# ---
# Data Structures:
# 'abCdef 123'
# { lowercase: 0, uppercase: 0, neither: 0 } => { lowercase: 5, uppercase: 1, neither: 4 } => { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# 5 * 100.0 / argument.length => 50.0

# ---
# Algorithm:
# initialize a Hash with 3 symbol keys, :lowercase, :uppercase, :neither- all set to 0
# iterate through the argument's characters:
#   determine if the character is uppercase, lowercase, or neither
#   add 1 to the appropriate key's value
# iterate through the Hash's values:
#   mutate the values by multiplying them by 100.0 (must be a float) and dividing them by the length of the argument
# return the Hash

# ---
# Code:

def letter_percentages(str)
  letter_breakdown = { lowercase: 0, uppercase: 0, neither: 0 }
  length = str.length

  str.each_char do |char|
    case char
    when 'a'..'z' then letter_breakdown[:lowercase] += 1
    when 'A'..'Z' then letter_breakdown[:uppercase] += 1
    else               letter_breakdown[:neither]   += 1
    end
  end

  letter_breakdown.each { |k, v| letter_breakdown[k] = (v * 100.0 / length).round(1) }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}