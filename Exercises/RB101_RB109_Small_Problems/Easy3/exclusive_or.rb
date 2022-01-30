=begin
Understanding the **Problem**:
- Create a method called `xor()` that takes 2 arguments and returns `true` if exactly 1 argument is `true`, else `false`.

Questions/Answers:
- What is the input?
    - 2 expressions.
- What is the output?
    - Boolean value.
- Can the arguments be complex expressions?
    - Test cases are a single method with a caller, but more complex conditions should be fine.
- Can `nil` be passed as an argument?
    - Yes, that will evaluate as falsy.
- Can the arguments be literals?
    - Yes.
        
Mental Model:
- Create a method called `xor()` that takes 2 arguments.  Evaluate both arguments.  If only one argument is true, return true.  Else return false.

**Examples/Tests**:
```ruby
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
```
**Data Structures**:
None.

**Algorithm**:
- START

- SET counter = 0
- IF argument1 then counter += 1
- IF argument2 then counter += 1

- IF counter == 1
  - true
- ELSE
  - false

- END
**Code**:
=end
# SOLUTION 1.
# def xor?(argument1, argument2)
#   counter = 0
#   counter += 1 if argument1 || argument2
#   counter -= 1 if argument1 && argument2

#   if counter == 1
#     true
#   else
#     false
#   end
# end


# SOLUTION 2.  REFACTORED.
def xor?(this, that)
  (this || that) != (this && that)
end
