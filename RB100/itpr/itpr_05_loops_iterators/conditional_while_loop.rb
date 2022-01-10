# This program uses 'while' to output odd numbers up from 0 to 10.

x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end
