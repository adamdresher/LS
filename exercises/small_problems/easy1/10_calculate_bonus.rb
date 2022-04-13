def calculate_bonus(salary, bonus)
  unless salary >= 0   then return puts("<salary must be a natural number>") end
  unless bonus == true then return puts("<bonus must be a boolean>") end

  salary / 2
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
