def step(start_val, end_val, step_val)
  counter = start_val

  while end_val >= counter
    yield(counter)
    counter += step_val
  end

  [start_val, end_val, step_val]
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
