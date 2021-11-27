arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

puts "\narr unmodified:"
p arr

puts "\narr without elements beginning with 's'."
p arr.delete_if { |element| element.start_with?("s") }

puts "\narr unmodified:"
arr.unshift("snow")[3,0] = "slippery", "salted roads"
p arr

puts "\narr without elements beginning with 's' or 'w'."
p arr.delete_if { |element| element.start_with?("s", "w") }
puts "\n"
