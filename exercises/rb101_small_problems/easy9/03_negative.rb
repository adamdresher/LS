def negative(num)
  num.negative? ? num : num * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
