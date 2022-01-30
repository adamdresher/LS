=begin
Understanding the **Problem**:
- Write a program that asks user for 6 numbers, then checks if the 6th number is also one of the first 5 numbers.

Questions/Answers:
- What is the input?
    - 6 numbers.
- What is the output?
    - A string.
        
Mental Model:
- Write a program that asks the user for a number 6 times.  Create a list using the first 5 numbers and check if any listed numbers match the 6th number.  Output whether or not the list matches.

**Examples/Tests**:
```ruby
# Input:
25
15
20
17
23
17
# Output:
The number 17 appears in [25, 15, 20, 17, 23].

# Input:
25
15
20
17
23
18
# Output:
The number 18 does not appear in [25, 15, 20, 17, 23].
```
**Data Structures**:
Array

**Algorithm**:
- START

- SET list = empty array
- WHILE iterator <= 6
  - LOOP
    - PRINT request iterator/6 input.
    - IF input == integer
      - SET list += input
      - iterator += 1
    - ELSE 
      - PRINT error
    - go to next iteration

- SET target = last number of array
  - remove target from array
- WHILE iterator <= length of array
  - IF element == target
    - PRINT target is in the list
    - BREAK
  - ELSE
    - iterator += 1
  - go to the next iteration
  - PRINT target is not in the list
  
- END

**Code**:
=end
ORDINALS = ['1st', '2nd', '3rd', '4th', '5th', 'last']

def prompt(message)
  Kernel.puts("==> #{message}")
end

checklist = []

6.times do |num|
  loop do
    prompt("Enter the #{ORDINALS[num]} number:")
    number = gets.chomp
    if number.to_i.to_s == number || number.dup.chars.all? == '0'
      checklist << number.to_i
      break
    else
      prompt("That's not a valid input.")
    end
  end
end

target = checklist.pop
if checklist.include?(target)
  prompt("The number #{target} appears in your list: #{checklist}.")
else
  prompt("The number #{target} does not appear in your list: #{checklist}.")
end
