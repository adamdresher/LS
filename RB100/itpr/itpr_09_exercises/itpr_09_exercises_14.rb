a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

b = a.map { |element| element.split }
p b.flatten!

puts "\na"
p a
puts "\nb"
p b
puts "\n"
