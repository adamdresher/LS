=begin
Understanding the **Problem**:
- Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

Further Exploration:
- Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

Questions/Answers:
- What is the input?
    - There is none.
- What is the output?
    - A string.

Mental Model:
- Create a method that randomly generates an integer between 20 and 200, then outputs a string with that integer.

Mental Model with Further Exploration:
- Create a method with a parameter.  The parameter's default value is `Teddy`.  The method randomly generates an integer between 20 and 200, then outputs a string with the parameter as a name and random integer as an age.

**Examples/Tests**:
```ruby
# Teddy is 69 years old!
```
**Data Structures**:
String and Integer.

**Algorithm**:
- Algorithm 1:
  - Create a method called, `teddy`.
  - Assign a variable to a randomly generated number between 20 and 200.
  - Output a string with the variable.

- Algorithm 2:
  - Create a method called, `teddy`.
  - Output a string with a method inconcatenated to generate a random number between 20 and 200.

- Algorithm 3:
  - Create a method called, `teddy`.
  - Assign a variable to a number sampled from a range of 20 to 200.
  - Output a string with the variable.

- Algorithm 4 with Further Exploration:
  - Create a method called, `teddy` that takes a parameter called, `name`.
  - `name` has a default value of `Teddy`.
  - Assign a variable to a number sampled from a range of 20 to 200.
  - Output a string with the variable as the age and `name` as the name.

**Code**:
=end
# SOLUTION 1.
def teddy
  age = rand(20..200)
  puts "Teddy is #{age} years old!"
end


# SOLUTION 2.  REFACTORED.
def teddy
  puts "Teddy is #{rand(20..200)} years old!"
end


# SOLUTION 3.  SAMPLING A RANGE.
def teddy
  age = [(20..200)].sample
  puts "Teddy is #{age} years old!"
end


# SOLUTION 4.  FURTHER EXPLORATION.
def teddy
  puts "Give me a name, any name:"
  name = gets.chomp
  (name = 'Teddy') if name == ''
  age = [(20..200)].sample
  puts "#{name} is #{age} years old!"
end


# SOLUTION 5.  FURTHER EXPLORATION.  REFACTORED.
def teddy
  puts "Give me a name, any name:"
  if (name = gets.chomp) == '' then name = 'Teddy' end
  age = [(20..200)].sample
  puts "#{name} is #{age} years old!"
end
