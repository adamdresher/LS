=begin
Understanding the **Problem**:
- Print all odd numbers from `1` to `99`, inclusive, to the console, with each number on a separate line.

Questions/Answers:
- What is the input?
    - Given integers `1` to `99`.
- What is the output?
    - 99 integers on their own line.
        
Mental Model:
- Create a method that prints odd numbers on a new line one at a time, starting with 1 and ending with 99.

**Examples/Tests**:
```ruby
1
2
...
98
99
```
**Data Structures**:
None.

**Algorithm**:
- Algorithm 1:
  - START
  - WHILE iterator <= 99
    - IF iterator is odd
    - PRINT iterator
    - iterator += 1
  - END
  
**Code**:
=end
# SOLUTION 1.
def odd_num
  count = 0
  while count <= 99
    Kernel.puts(count) if count % 2 == 1
    count += 1
  end
end


# SOLUTION 2.
def odd_num
  100.times { |num| puts num if num.odd? }
end


# SOLUTION 3.  FURTHER EXPLORATION.
def odd_num
  (1..99).to_a.select { |num| if num.odd? }
end


# SOLUTION 4.  FURTHER EXPLORATION.
def odd_num
  1.upto(99) do |num|
    num.odd?
  end
end
