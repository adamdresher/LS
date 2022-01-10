def add(num1, num2)
  result = num1 + num2
end

def multiply(num1, num2)
  result = num1 * num2
end

# TEST CASES
puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
