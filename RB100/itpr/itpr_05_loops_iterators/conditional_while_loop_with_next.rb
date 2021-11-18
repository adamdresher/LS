# This program uses a 'while' loop to output odd integers from 0 to 10, excluding 3 with a conditional 'next' statement.

x = 0

while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end
