# Problem:
# A method that returns the sum of two integers.


# Pseudo-code
# Given 2 integers.
# Combine the sum of the 2 integers.
# Return the sum.


# Formal Pseudo-code:
# START

# Given 2 integers

# SET sum = integer1 plus integer2
# PRINT sum
# END


# Code:
def add(num1, num2)
  sum = num1 + num2
end


# Problem:
# A method that takes an array of strings, and returns a string that is all those strings concatenated together.


# Pseudo-code:
# Given an array of strings.
# Combine the string elements together.
# Return the combined string.


# Formal Pseudo-code:
# START

# Given an array of strings

# SET variable = ''
# READ each element within the array
# WHILE iterator < length of array
  # SET variable += element array

  # iterator += 1

  # PRINT variable

  # END


  # Code:
  def stringification(arr)
    new_string = ''
    arr.each do |string|
      new_string += string
    end
  end


# Problem:
# A method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:
# everyOther([1,4,7,2,5]) # => [1,7,5]


# Pseudo-code:
# Given a collection of integers.

# Create a new, empty collection.
# Iterate through the collection, one at a time.
  # - Add the first element to the new collection.
  # - For every following iteration, every other element is added to the new collection.

# After interating through the collection, return the new collection.


# Formal Pseudo-code:
# START

# Given a collection_of_integers

# SET an empty new_collection
# WHILE iterator <= length of the collection_of_integers
#   READ location of current_number
#   IF location == even
#     SET new_collection += current_number
#   iterator += 1
#   go to the next iteration

# PRINT new_collection

# END


# Code:
def everyOther(list_of_num)
  new_list = []
  list_of_num.each_with_index do |num, index|
    if index.even? then new_list.push(num) end
  end
  
  new_list
end


# Problem:
# A method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.


# Pseudo-code:
# Given a string and a character.

# Check if the character is found in the string 3 or more times.
# If the character is found less than 3 times, return nil.

# From left to right, locate the 3rd occurrence of the character in the string.
# Check the location of the 3rd occurrence.
# Return the location.


# Formal Pseudo-code:
# START

# Given a string and a character

# READ the string and count how many times it finds the character
# IF the count is less than 3, return nil

# SET string to a new_collection of characters
# WHILE iterator <= length of the new_collection
#   IF character == char
#     SET counter += 1
#     IF counter == 3
#       READ the location of character
#   iterator += 1

# PRINT the location

# END


# Code:
third_occurrence(string, char)
  return nil if string.count(char) < 3

  string_to_arr = string.chars
  count = 0
  string_to_arr.each_with_index do |letter, index|
    if letter == char
      count += 1
      return index if count == 3
    end
  end
end


# Problem:
# A method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should becoome the elements at the odd indexes. For instance:
# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]
# You may assume that both array arguments have the same number of elements.


# Pseudo-code:
# Given two collections of numbers.

# Create a new_collection.
# Iterate through both collections simultaneously.
#   - Move the first element from the first_collection to the new_collection.
#   - Move the first element from the second_collection to the new_collection.

# After iterating, return the new_collection.


# Formal Pseudo-code:
# START

# Given two collections of numbers

# SET an empty new_collection
# WHILE iterator <= length of the first_collection
#   SET new_collection += first element of first_collection
#     remove first element from first_collection
#   SET new_collection += first element of second_collection
#     remove first element from second_collection
#   iterator += 1
  
# PRINT new_collection

# END


# Code:
def merge(first_collection, second_collection)
  new_collection = []
  first_collection.each |do|
    new_collection += first_collection[0]
    new_collection += second_collection[0]
  end
  new_collection
end
