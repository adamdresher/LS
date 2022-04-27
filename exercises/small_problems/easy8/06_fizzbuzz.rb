def fizzbuzz(num1, num2)
  (num1..num2).each_with_object([]) do |num, arr|
    arr << case 0
           when num % 3 && num % 5 then 'FizzBuzz'
           when num % 3            then 'Fizz'
           when num % 5            then 'Buzz'
           else                          num.to_s
           end
  end.join ', '
end

p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
