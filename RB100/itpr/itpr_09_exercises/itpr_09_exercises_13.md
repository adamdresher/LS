Use Ruby's Array method `delete_if` and String method `start_with?` to delete all of the strings that begin with an "s" in the following array.
`arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']`
Then recreate the `arr` and get rid of all of the strings that start with "s" or starts with "w".

##### MY SOLUTION
```
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
```
