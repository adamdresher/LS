=begin
Understanding the **Problem**:
- Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

Questions/Answers:
- What is the input?
    - User's input as a string.
- What is the output?
    - A string.
        
Mental Model:
- Create a method that asks user for her/his name.  If input's last character is `!`, output a string in all caps.  If the last character is not an `!`, then output a string like a civilized computer.

**Examples/Tests**:
```ruby
What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
```
**Data Structures**:
Array

**Algorithm**:
- Algorithm 1:
  - START
  - GET user's name
    - SET input to `name`
  - READ `name` in reverse
    - IF `name`'s first character = `!`
      - PRINT string with `name` in all caps.
    - ELSE
      - PRINT string with `name`.
  - END
  
**Code**:
=end
def hello
  Kernel.print('What is your name? ')
    name = gets.chomp
  
  if name.reverse[0] == '!'
    Kernel.puts("HELLO #{name.upcase}.  WHY ARE WE SCREAMING??!")
  else
    Kernel.puts("Hello #{name}.  Want to scream for ice cream?")
  end
end
