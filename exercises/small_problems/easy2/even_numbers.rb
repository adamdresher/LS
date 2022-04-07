=begin
Understanding the **Problem**:
- Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

Questions/Answers:
- What is the input?
    - Given integers 1..99.
- What is the output?
    - Integers.
        
Mental Model:
- Create a method that outputs a successive even number on a new line starting with 1 and ending with 99.

**Examples/Tests**:
```ruby
2
4
..
96
98
```
**Data Structures**:
None.

**Algorithm**:
- Algorithm 1:
  - START
  - SET iterator = 1
  - WHILE iterator < 99
    - IF iterator is even
      - PRINT iterator
    - SET iterator += 1
    - next iteration
  - END

**Code**:
=end
# SOLUTION 1.
def even_num_to_99
  iterator = 1
  while iterator < 99
    Kernel.puts(iterator if iterator.even?)
    iterator += 1
  end
end


# SOLUTION 2.
def even_num_to_99
  1.step(by: 1, to: 99) { |num| Kernel.puts(num) if num.even? }
end


Kernel.puts('Solution 1')
even_num_to_99
Kernel.puts("\nSolution 2")
even_num_to_99
