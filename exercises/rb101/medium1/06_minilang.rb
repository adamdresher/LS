=begin
input: String (of arithmetic expressions)
return: String (formatted)
goal: format the argument to commands that #minilang can evaluate
rules:
  parantheses define higher precedence
  standard arithmetic expressions should be converted to minilang commands
    '+' == 'ADD'
    '-' == 'SUB'
    '/' == 'DIV'
    '*' == 'MULT'
    '%' == 'MOD'

(3 + (4 * 5) - 7) / (5 % 3)')
reg: 0, stk: []
( => add precedence => reg: 0, stk: [], check: , hold: []            hold
3 => reg: 3, stk: [], check: , hold: []                              n
+ => reg: 3, stk: [3], check: 'ADD' hold: []                         PUSH, chck

( => add precedence => reg: 3, stk: [3], check: , hold: ['ADD']      hold
4 => reg: 4, stk: [3], check: , hold: ['ADD']                        n
* => reg: 4, stk: [3, 4], check: 'MULT', hold: ['ADD']               PUSH, chck
5 => reg: 5, stk: [3, 4], check: , hold: ['ADD']                     n, call
  second operand found => 'MULT' =>
reg: 20, stk: [3], check: , hold: ['ADD']
) => end precedence => 'ADD' =>                                      call
reg: 23, stk: [], check: , hold: []

- => reg: 23, stk: [23], check: 'SUB', hold: []                     PUSH, chck
7 => reg: 7, stk: [23], check: , hold: []                           n, call
  second operand found => 'SUB' =>
reg: 16, stk: [], check: , hold: []
) => end precedence => nil                                          call

/ => reg: 16, stk: [16], check: 'DIV', hold: []                     PUSH, chck

( => add precedence => reg: 16, stk: [16], check: , hold: ['DIV']   hold
5 => reg: 5, stk: [16], check: , hold: ['DIV']                      n
% => reg: 5, stk: [16, 5], check: 'MOD', hold: ['DIV']              PUSH, chck
3 => reg: 3, stk: [16, 5], check: , hold: ['DIV']                   n, call
  second operand found => 'MOD'
reg: 2, stk: [16], check: , hold: ['DIV']
) => end precedence => reg: 8, stk: [], check: , hold: []           call


identify precedence start/end (parantheses)
  track precedence
identify 2nd operand (after operator)

Algorithm:
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
=end

def minilang(program)
  register = 0
  stack = []
  commands = program.split

  commands.each do |command|
    case command
    when command.to_i.to_s then register = command.to_i
    when 'PUSH'            then stack << register
    when 'ADD'             then register += stack.pop
    when 'SUB'             then register -= stack.pop
    when 'MULT'            then register *= stack.pop
    when 'DIV'             then register /= stack.pop
    when 'MOD'             then register %= stack.pop
    when 'POP'             then register = stack.pop
    when 'PRINT'           then puts register
    end
  end
end

# ---- Tests ----
# minilang('5 PUSH 3 MULT PRINT')
# => reg: 5 => reg: 5, stk: 5 => reg: 3 stk: 5 => reg: 15, stk: 0 => 15
# 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # => reg: 5 => 5 => reg: 5, stk: 5 => reg: 3, stk: 5 => 3 => reg: 8, stk: 0 => 0
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # reg: 3 => reg: 3, stk: [3] => reg: 4, stk: [3] => reg: 4, stk: [3, 4] =>
# # reg: 5, stk [3, 4] => reg: 5, stk: [3, 4, 5] => 5 => reg: 10, stk: [3, 4]
# # => 10 => reg: 4, stk: [3] => 4 => reg: 7, stk: []
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # reg: 3 => reg: 3, stk: [3] => reg: 3, stk: [3, 3] => reg: 7, stk: [3, 3] =>
# # reg: 7 / 3, stk: [3] => reg: 2 * 3, stk: [] => 6
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# =begin
# algorithm 1 for creating nesting
create an empty array
  iterate through argument array
  if element == parentheses_opener
    add empty array

    until element == parentheses_closer
      do not add parentheses
      if element == parentheses_opener
        add empty array
    
        until element == parentheses_closer
          do not add parentheses
          add element

      add element
  
  add element

# algorithm 2 for creating nesting
create an empty array
case element
when '(' then PUSH
when ') '
  add 'PUSH'

# algorithm 3 for creating nesting
if parentheses_opener
  push register to stack
if parentheses_closer
  
if command
  invoke command on register with next integer as argument

# algorithm for formatting commands
case command
when '%' then 'MOD'
when '/' then 'DIV'
when '*' then 'MULT'
when '-' then 'SUB'
when '+' then 'ADD'
end

append command with 'PRINT'

    when command.to_i.to_s then register = command.to_i
    when 'PUSH'            then stack << register
    when 'ADD'             then register += stack.pop
    when 'SUB'             then register -= stack.pop
    when 'MULT'            then register *= stack.pop
    when 'DIV'             then register /= stack.pop
    when 'MOD'             then register %= stack.pop
    when 'POP'             then register = stack.pop
    when 'PRINT'           then puts register
# =end

def format_to_minilang(equation)
  program = []
  commands = equation.split ''
  commands.delete ' '

  
end

p minilang(format_to_minilang('(3 + (4 * 5) - 7) / (5 % 3)')) == 8

(                                 # push next num to stack
3       stack: []; register: 3
push    stack: [3]; register: 3  # nums push to stack
(                                 # push next num to stack
4       stack: [3]; register: 4
push    stack: [3, 4]; register: 4  # nums push to stack
5       stack: [3, 4]; register: 5
mult    stack: [3]; register: 20  # after 5 is recorded to register
)                                 # 2
plus    stack: []; register: 23  # after inner parentheses are evaluated
push    stack: [23]; register: 23  #