# MIN_IN_DAY = 1440 # 60 min/hr * 24 hrs/day

# def after_midnight(time)
#   hrs = time[0..1].to_i # extracts hours and converts to integer
#   min = time[-2..-1].to_i # extracts minutes and converts to integer
#   result = (hrs * 60) + min # converts `hrs` to minutes and adds `min`

#   result == MIN_IN_DAY ? 0 : result # checks if `result` is a full day and resets if `true`
# end

# def before_midnight(time)
#   result = after_midnight(time) # converts `time` to minutes

#   result == 0 ? 0 : (1440 - result) # checks and returns if `time` is `0`, else inverts time
# end


# Solution.  Refactored to be more readable.
MIN_IN_DAY = 1440 # 60 min/hr * 24 hrs/day

def after_midnight(time)
  hrs = time[0..1].to_i # extracts hours
  min = time[-2..-1].to_i # extracts minutes
  result = (hrs * 60) + min # converts `time` to minutes

  return 0 if result == MIN_IN_DAY
  result
end

def before_midnight(time)
  result = after_midnight(time) # converts `time` to minutes

  return result if result == 0
  1440 - result
end


# Solution.  Alternative.
# def after_midnight(time)
#   time = time.chars.reject { |ele| ele == ':' }
#   hrs = time[0..1].join.to_i
#   min = time[-2..-1].join.to_i

#   result = (hrs * 60) + min

#   result == 1440 ? 0 : result
# end

# def before_midnight(time)
#   minutes = after_midnight(time)
#   minutes == 0 ? 0 : (1440 - minutes)
# end


# Solution.  Further Exploration.
require 'Time'
MIN_IN_DAY = 1440 # 60 min/hr * 24 hrs/day

def after_midnight(time)
  present, future = 
    Time.new(0).to_i, Time.new(0, 1, 1, time[0, 2], time[3, 2]).to_i
    # sets `present` to midnight and sets `future` to `time`

  result = (future - present) / 60 # returns `time` in minutes
  result == MIN_IN_DAY ? 0 : result
end

def before_midnight(time)
  after_midnight(time) == 0 ? 0 : MIN_IN_DAY - after_midnight(time)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
