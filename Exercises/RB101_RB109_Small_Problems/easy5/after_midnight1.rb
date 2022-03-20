# def inverse_time(hrs, min) # formats time for the past (negative `time` argument)
#   unless min == 0 # cycles back `min` and `hrs` by `min` minutes.
#     min = 60 - min
#     hrs += 1
#   end
#   unless hrs == 0 # cycles back `hrs` by `hrs` hours.
#     hrs = 24 - hrs
#   end

#   [hrs, min]
# end

# def format_time(hrs, min) # formats return value
#   format("%02d",hrs) + ':' + format("%02d",min)
# end

# def time_of_day(time)
#   past = time < 0 # checking if `time` is the past
#   hrs, min = time.abs.divmod(60) # returns `hrs` with multiple days

#   hrs = hrs % 24 # removes multiple days

#   if past # adjusts return value if `time` is the past
#     hrs, min = inverse_time(hrs, min)
#   end

#   format_time(hrs, min)
# end

# Solution.  Further Exploration: Problem 1.
MINUTES_PER_DAY = 24 * 60  # hours/day * minutes/hour

def time_of_day(time)
  time = time % MINUTES_PER_DAY # removes multiple days and returns remainder time in minutes
  hrs, min = time.divmod(60) # returns remainder time in hours and minutes

  format("%02d:%02d",hrs, min)
end
