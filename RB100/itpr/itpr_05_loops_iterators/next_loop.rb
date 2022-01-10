# This program uses 'next' to skip a number when outputs even numbers 0 to 10.

i = 0
loop do
  i = i + 2
  if i == 4
    next
  end
  puts i
  if i == 10
    break
  end
end
