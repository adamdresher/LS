# Understanding the Problem:
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.


# Input: A String
# Return: A Boolean
# Goal: Determine whether the argument can be created using the given blocks of characters.
# Rules:
#   each character block can only be used once
#   case insensitive
#   only alphabetical characters are considered (no whitespaces)

# Mental Model:
# Iterate through the argument's characters.  If the character is not found in the spelling_blocks, return false.  Else remove the block from the spelling_blocks and next iteration.  Return true after all iterations.

# ---
# Examples/Tests:
# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

# ---
# Data Structures:
# spelling_blocks = [['b', 'o'], ['x', 'k']]
#   iterate through Array elements, but check inside the Array elements to access Strings

# Examples:
# 'bob' => [['x', 'k']] => false
# - 'o' is no longer found in the spelling_blocks
# 'bk' => [['x', 'k']] => [] => true

# ---
# Algorithm:
# take a String argument
# initializing an spelling_blocks Array of nested Arrays
#   nested Arrays contain 2 Strings (character block)

# upcase the argument
# iterate through the String's characters
#   iterate through the spelling_block Array's nested Arrays
#     if the current Array contains the current character
#       select the Array
#   convert value into a one dimensional array

#   if an Array is found
#     remove the block from spelling_blocks
#   else
#     return false
# return true

# ---
# Code:

def block_word?(str)
  spelling_blocks = [
    ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
    ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
    ['V', 'I'], ['L', 'Y'], ['Z', 'M']
  ]

  str.upcase.each_char do |char|
    block = spelling_blocks.select do |block|
              block.include?(char)
            end.flatten # otherwise a nested array is returned

    block.any? ? spelling_blocks.delete(block) : return false
  end
  true # if all letters in argument remove a block from spelling_blocks
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
