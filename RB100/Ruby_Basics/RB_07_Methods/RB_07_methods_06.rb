# # SOLUTION 1.  USING `if/unless`.
# daylight = [true, false].sample

# def time_of_day(light_check)
#   if light_check then puts "It's daytime!" end
#   unless light_check then puts "It's nighttime!" end
# end

# time_of_day(daylight)


# # SOLUTION 2.  USING TERNARY FORM.
daylight = [true, false].sample

def time_of_day(light_check)
  light_check ? (puts "It's daytime!") : (puts "It's nighttime!")
end

time_of_day(daylight)
