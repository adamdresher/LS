# This program uses 'loop' to output even numbers 0 to 10.

i = 0
loop do
  i = i + 2
  puts i
  if i == 10
    break
  end
end