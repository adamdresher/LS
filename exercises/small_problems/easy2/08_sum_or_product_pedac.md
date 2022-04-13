### Understanding the Problem
Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

**Explicit Requirements:**

- Input: Two user inputs, an integer greater than zero and one of two string inputs.
- Output: A string.

**Implicit requirements:**

- 

**Mental Model:**

- Create a program that accepts user input twice.  The first input is an integer greater than zero.  The second input is one of two string options.  Use second input to calculate how to combine all integers between 1 and first input.  Output the result in a string statement.

---
### Examples/Tests
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
---
### Data Structures
Range or Array or simply iterate.

---
### Algorithm
Algorithm 1:
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

Algorithm 2:
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

---
### Code
*see `08_sum_or_product.rb`*
