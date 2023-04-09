# Problem
input: String (of values and commands)
return: Integer (register value)
goal: create a method that performs operations based on the input's directions
rules:
  register value starts at 0
  stack starts empty
  if a valid String command is passed as an argument, a operation occurs on the
  register and/or stack
  values and commands are passed as a single String, delimited by whitespace
  
  the following are valid commands and their implementation
    n Place a value n in the "register". Do not modify the stack.
    PUSH Push the register value on to the stack. Leave the value in the register.
    ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    POP Remove the topmost item from the stack and place in register
    PRINT Print the register value

# Examples
```
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# => reg: 5 => reg: 5, stk: 5 => reg: 3 stk: 5 => reg: 15, stk: 0 => 15
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# => reg: 5 => 5 => reg: 5, stk: 5 => reg: 3, stk: 5 => 3 => reg: 8, stk: 0 => 0
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# reg: 3 => reg: 3, stk: [3] => reg: 4, stk: [3] => reg: 4, stk: [3, 4] =>
reg: 5, stk [3, 4] => reg: 5, stk: [3, 4, 5] => 5 => reg: 10, stk: [3, 4] => 10
=> reg: 4, stk: [3] => 4 => reg: 7, stk: []
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# reg: 3 => reg: 3, stk: [3] => reg: 3, stk: [3, 3] => reg: 7, stk: [3, 3] =>
reg: 7 / 3, stk: [3] => reg: 2 * 3, stk: [] => 6
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
```

# Data Structures
register = Integer
stack = Array of Integers
commands = helper methods
              mini_n(register)
              mini_push(register, stack)
              mini_add(register, stack)
              mini_sub(register, stack)
              mini_mult(register, stack)
              mini_div(register, stack)
              mini_mod(register, stack)
              mini_pop(register, stack)
              mini_print(register)

# Algorithm
  setup register, stack, and helper methods
    initialize register = 0
    initialize stack = []
    assign helper methods

  split the argument into a list of words with whtiespace delimiter
  iterate through the list of words
    if word is a number
      reassign register to this number
    else
      call the method referenced by the word
        pass method the register and stack

  mini_push(register, stack)
    append register value to the end of the stack

  mini_add(register, stack)
    pop number from end of stack
    reassign register to itself plus number

  mini_sub(register, stack)
    pop number from end of stack
    reassign register to itself minus number

  mini_mult(register, stack)
    pop number from end of stack
    reassign register to itself multiplied by number

  mini_div(register, stack)
    pop number from end of stack
    reassign register to itself divided by number

  mini_mod(register, stack)
    pop number from end of stack
    reassign register to itself modulo by number

  mini_pop(register, stack)
    pop number from end of stack
    reassign register to number

  mini_print(register)
    print the register

# Code
