def fibonacci_last(nth)
  current_num = 0
  last_num = 0

  nth.times do
    if current_num == 0
      current_num = 1
    else
      current_num, last_num = current_num + last_num, current_num
    end
  end
  current_num.digits[0]
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
