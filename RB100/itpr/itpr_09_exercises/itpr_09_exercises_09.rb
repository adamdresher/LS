h = {a:1, b:2, c:3, d:4}

puts "\n1."
p h[:b]

puts "\n2."
h[:e] = 5
p h

puts "\n3."
p h.delete_if { |k, v| v < 3.5 }
