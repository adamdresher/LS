=begin
Understanding the **Problem**:
- Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Questions/Answers:
- What is the input?
    - Two user inputs, an integer greater than zero and one of two string inputs.
- What is the output?
    - A string.
        
Mental Model:
- Create a program that accepts user input twice.  The first input is an integer greater than zero.  The second input is one of two string options.  Use second input to calculate how to combine all integers between 1 and first input.  Output the result in a string statement.

**Examples/Tests**:
```ruby
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
```
**Data Structures**:
Range or Array or simply iterate.

**Algorithm**:
- Algorithm 1:
  - START
  - PRINT request for integer input greater than 0
  - GET input
  - SET `num` = input converted to an integer
  - SET `range` = to a collection of 1..`num`

  - PRINT request for string input, `'s'` for sum or `'p'` for product
  - GET input
  - IF input != `'s'` or `'p'`
    - PRINT error
    - END
  - SET `operator` = input

  
  - IF `operator` = `s`
    - SET `result` = `0`
    - WHILE iterator < `num`
      - SET `result` += `num`
  - ELSE
    - SET `result` = `1`
    - WHILE iterator < `num`
      - SET `result` = `product` * `num`
    
    - IF `operator` == `s`
      - PRINT string with `num` and `result`
    - ELSE
      - PRINT string with `num` and `result`
  - END


- Algorithm 2:
  - START
  - SET `operations` = new hash
    - SET first key value  = `'s'` => `['sum', 0]`
    - SET second key value = `'p'` => `['product', 1]`

  - PRINT request for integer input greater than 0
  - GET input
  - SET `num` = input converted to an integer
  - SET `num` = to a collection of 1..num

  - PRINT request for string input
  - GET input
  - IF input != `'s'` or `'p'`
    - PRINT error
    - END
  - SET `operator` = input


  - WHILE iterator < `num`
    - IF `operations` key = `s`
      - SET `operations` value  += `num`
    - ELSE
      - SET `operations` value = value * `num`
    
    - PRINT string with `operations[0]`, a range from 1 ..`num`, and `operations[1]`
  - END



**Code**:
=end
# SOLTUION 1.
def compute_range

  Kernel.puts('>> Please enter an integer greater than 0:')
    num = gets.to_i
    unless num.positive? then return Kernel.puts('<Invalid Input>') end
    range = (1..num).to_a

  Kernel.puts(">> Enter 's' to compute the sum, 'p' to compute the product:")
    operator = gets.chomp
    unless operator == 's' || operator == 'p'
      return Kernel.puts('<Invalid Input>')
    end

  if operator == 's'
    result = 0
    range.each { |num| result += num }
    Kernel.puts("The sum of the integers between 1 and #{num} is #{result}.")
  else
    result = 1
    range.each { |num| result = result * num }
    Kernel.puts("The product of the integers between 1 and #{num} is #{result}.")
  end

end



# SOLUTION 2.
def compute_range
  operations = {
                's' => ['s', 'sum', 0],
                'p' => ['p', 'product', 1]
                }

  Kernel.puts('>> Please enter an integer greater than 0:')
    num = gets.to_i
    unless num.positive? then return Kernel.puts('<Invalid Input>') end
    range = (1..num).to_a

  Kernel.puts(">> Enter 's' to compute the sum, 'p' to compute the product:")
    operator = gets.chomp
    unless operator == 's' || operator == 'p'
      return Kernel.puts('<Invalid Input>')
    end

  if operations[operator][0] == 's'
    range.each { |num| operations[operator][2] += num }
  else
    range.each { |num| operations[operator][2] = operations[operator][2] * num }
    # iterator = 1
    # while iterator <= num
    #   operations[operator][2] = operations[operator][2] * iterator
    #   iterator += 1
    # end
  end

  Kernel.puts("The #{operations[operator][1]} of the integers between 1 and #{num} is #{operations[operator][2]}.")

end

compute_range
