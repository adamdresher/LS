=begin
Understanding the **Problem**:
- Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Further Exploration:
- Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

Questions/Answers:
- What is the input?
    - 2 user inputs which should be integers.
- What is the output?
    - A string inconcatenated with two integers.
- What are the two parameters?
- Do the parameters have to be integers or can they be floats, rationals, strings, etc?
    - The problem specifically says to not worry about validating inputs.
- Can the integers be zero or negative?
    - Logic dictates these are not valid inputs.  The problem implies this inputs can be ignored.
- What is the conversion for square feet to square inches?
    - 1 square foot = 144 square inches.
- What is the conversion for square feet to square centimeters?
    - 1 square foot = 929.0304 square centimeters

Mental Model:
- Create a program that asks for user input twice to determine the width and length (in meters) of a room.  Output a string that states the area of the room in square meters and square feet down to 2 decimal points.

Mental Model for Further Exploration:
- Create a program that asks for user input twice to determine the width and length (in feet) of a room.  Output a string that states the area of the room in square feet, square inches, and square centimeters down to 2 decimal points.

**Examples/Tests**:
```ruby
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
```
**Data Structures**:
Integers and floats.

**Algorithm**:
- Algorithm 1:
  - Create a method called, `area_of_room`.
  - Request the length of the room in meters, convert it to a float, and assign the input to the variable, `length`.
  - Request the width of the room in meters and assign the input to the variable, `width`.
  - Multiply the length and width and assign the return value to the variable, `area_m`.
  - Multiply `area_m` by `10.7639` and assign the return value to the variable, `area_ft`.
  - Output a string that states the area of the room in square meters as well as square feet.

- Algorithm 2 for Further Exploration:
  - Create a method called, `area_of_room`.
  - Assign a constant variable, `SQ_FT_TO_SQ_IN`, the conversion rate.
  - Assign a constant variable, `SQ_FT_TO_SQ_CM`, the conversion rate.
  - Request the length of the room in feet, convert it to a float, and assign the input to the variable, `length`.
  - Request the width of the room in feet and assign the input to the variable, `width`.
  - Multiply the length and width and assign the return value to the variable, `area_ft`.
  - Multiply `area_ft` by `SQ_FT_TO_SQ_IN` and assign the return value to the variable, `area_in`.
  - Multiply `area_ft` by `SQ_FT_TO_SQ_CM` and assign the return value to the variable, `area_cm`.
  - Output a string that states the area of the room in square feet, square inches, as well as square centimeters.

**Code**:
=end
# SOLUTION 1.
def area_of_room
  puts "Enter the length of the room in meters:"
  length = gets.to_f
  puts "Enter the width of the room in meters:"
  width = gets.chomp

  area_m = length * width
  area_ft = (area_m * 10.7639).truncate(2)
  puts "The area of the room is #{area_m} square meters (#{area_ft} square feet)."
end


# SOLUTION 2.  FURTHER EXPLORATION.
SQ_FT_TO_SQ_IN = 144
SQ_FT_TO_SQ_CM = 929.0304

def area_of_room
  puts "Enter the length of the room in feet:"
  length = gets.to_f
  puts "Enter the width of the room in feet:"
  width = gets.to_f

  area_ft = (length * width).round(2)
  area_in = (area_ft * SQ_FT_TO_SQ_IN).truncate(2)
  area_cm = (area_ft * SQ_FT_TO_SQ_CM).truncate(2)
  puts "The area of the room is #{area_ft} square feet (#{area_in} square inches & #{area_cm} square centimeters)."
end
