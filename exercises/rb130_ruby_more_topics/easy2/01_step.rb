# def step(start_val, end_val, step_val)
#   counter = start_val

#   while end_val >= counter
#     yield(counter)
#     counter += step_val
#   end

#   # returns nil
# end

# def step(start_val, end_val, step_val)
#   start_val.upto(end_val) do |num|
#     yield(num) if num % step_val == 1
#   end

#   step_val # return value is based on the method's name
# end

def step(start_val, end_val, step_val)
  stepped_arr = []
  start_val.upto(end_val) do |num|
    if num % step_val == 1
      yield(num)
      stepped_arr << num
    end
  end

  stepped_arr # return value contains incremented values
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
