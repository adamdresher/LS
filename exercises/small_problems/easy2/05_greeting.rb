# def hello
#   Kernel.print('What is your name? ')
#     name = gets.chomp
  
#   if name.reverse[0] == '!'
#     Kernel.puts("HELLO #{name.upcase}.  WHY ARE WE SCREAMING??!")
#   else
#     Kernel.puts("Hello #{name}.  Want to scream for ice cream?")
#   end
# end

# Soltuion.  Futher Exploration.
def hello
  Kernel.print('What is your name? ')
    name = gets.chomp!
  
  if name.reverse[0] == '!'
    Kernel.puts("HELLO #{name.chop!.upcase}.  WHY ARE WE SCREAMING??!")
    # name.chop! # this works, however it's more concise to chain it like above
    # Kernel.puts("HELLO #{name.upcase}.  WHY ARE WE SCREAMING??!")
  else
    Kernel.puts("Hello #{name}.  Want to scream for ice cream?")
  end
end

p hello
