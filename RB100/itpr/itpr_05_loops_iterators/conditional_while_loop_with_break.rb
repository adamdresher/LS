# This program uses a 'while' loop to output odd integers from 0 to 10, stopping if it reaches 7 via a conditional 'break' statement.

x = 0

while x <= 10
  if x == 7
    break
  elsif x.odd?
    puts x
  end
  x += 1
end