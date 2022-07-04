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

# Solution 2.
def xor?(this, that)
  (this || that) != (this && that)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
