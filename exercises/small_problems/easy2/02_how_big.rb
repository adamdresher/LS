# def area_of_room
#   puts "Enter the length of the room in meters:"
#   length = gets.to_f
#   puts "Enter the width of the room in meters:"
#   width = gets.chomp

#   area_m = length * width
#   area_ft = (area_m * 10.7639).truncate(2)
#   puts "The area of the room is #{area_m} square meters (#{area_ft} square feet)."
# end

# Solution.  Further Exploration.
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

p area_of_room
