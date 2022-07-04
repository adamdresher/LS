def fibonacci(nth)
  return nth if nth < 2
  # nth <= 1 also works, but requires an unncessary extra recursion
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(0)
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
